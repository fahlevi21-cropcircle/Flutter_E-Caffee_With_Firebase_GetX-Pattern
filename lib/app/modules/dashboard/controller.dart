import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_caffee/app/data/models/products/product/product.dart';
import 'package:my_caffee/app/modules/cart/repository.dart';
import 'package:my_caffee/routes/pages.dart';

import 'repository.dart';

class DashboardController extends GetxController {
  final DashboardRepository repository;
  final CartsRepository cartsRepository;
  final Reference imagePath;
  final _numberFormat =
      NumberFormat.currency(locale: 'en-US', symbol: '\$ ', decimalDigits: 2);
  DashboardController({
    required this.repository,
    required this.imagePath,
    required this.cartsRepository,
  });

  final _products = <Product>[].obs;
  set products(value) => _products.value = value;
  List<Product> get products => _products;

  late final User? _currentUser;

  final _productNameTextController = TextEditingController();
  set productNameTextController(value) =>
      _productNameTextController.value = value;
  TextEditingController get productNameTextController =>
      _productNameTextController;

  final _productDescriptionTextController = TextEditingController();
  set productDescriptionTextController(value) =>
      _productDescriptionTextController.value = value;
  TextEditingController get productDescriptionTextController =>
      _productDescriptionTextController;

  final _productPriceTextController = TextEditingController();
  set productPriceTextController(value) =>
      _productPriceTextController.value = value;
  TextEditingController get productPriceTextController =>
      _productPriceTextController;

  final _productCategoryTextController = TextEditingController();
  set productCategoryTextController(value) =>
      _productCategoryTextController.value = value;
  TextEditingController get productCategoryTextController =>
      _productCategoryTextController;

  final _submittingData = false.obs;
  set submittingData(value) => _submittingData.value = value;
  bool get submittingData => _submittingData.value;

  final _selectedProduct = const Product.pure().obs;
  set selectedProduct(value) => _selectedProduct.value = value;
  Product get selectedProduct => _selectedProduct.value;

  final _loadingProduct = false.obs;
  set loadingProduct(value) => _loadingProduct.value = value;
  bool get loadingProduct => _loadingProduct.value;

  @override
  void onInit() {
    repository.products().listen((event) {
      loadingProduct = true;
      var value = event.snapshot.value;
      var newProducts = <Product>[];
      if (value != null) {
        var data = value as Map<dynamic, dynamic>;
        data.forEach((key, value) {
          if (key != null && value != null) {
            newProducts.add(
              Product.pure(
                uuid: key,
                name: value["name"],
                description: value["description"],
                image: value["image"],
                category: value["category"],
                price: double.tryParse(
                  value["price"].toString(),
                ),
              ),
            );
          }
        });
        loadingProduct = false;
      }

      products = newProducts;
    });
    super.onInit();

    // get current user
    _currentUser = repository.getCurrentUser();

    // initialize local database
    _openDatabase();
  }

  @override
  void onClose() {
    productNameTextController.dispose();
    productDescriptionTextController.dispose();
    productPriceTextController.dispose();
    productCategoryTextController.dispose();
    _closeDatabase();
    super.onClose();
  }

  createProduct({required Product product}) async {
    submittingData = true;
    await Future.delayed(const Duration(seconds: 2));
    try {
      repository.createProduct(product).then((_) {
        submittingData = false;
        productNameTextController.clear();
        productDescriptionTextController.clear();
        productPriceTextController.clear();
        productCategoryTextController.clear();

        if (Get.currentRoute != Routes.DASHBOARD) {
          Navigator.of(Get.context!).pop();
        }
        Get.showSnackbar(
          const GetSnackBar(
            message: 'Products created!',
            duration: Duration(seconds: 1),
          ),
        );
      });
    } catch (e) {
      Get.log(e.toString(), isError: true);
      submittingData = false;
      Get.showSnackbar(
        const GetSnackBar(
          message: 'An error occurred!',
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  removeProduct(int index) {
    selectedProduct = products.removeAt(index);
    selectedProduct.whenOrNull(
      pure: (uuid, name, description, price, category, image) {
        Timer timer = Timer(
          const Duration(seconds: 2),
          () => repository.deleteProduct(id: uuid!).then((_) => null),
        );
        Get.showSnackbar(GetSnackBar(
          message: 'Product deleted!',
          mainButton: TextButton(
              onPressed: () {
                Get.closeCurrentSnackbar();
                timer.cancel();
                products.insert(index, selectedProduct);
              },
              child: const Text('UNDO')),
          duration: const Duration(seconds: 2),
          animationDuration: const Duration(milliseconds: 300),
        ));
      },
    );
  }

  signOut() async {
    Get.defaultDialog(middleText: 'Logging out..', barrierDismissible: false);
    await Future.delayed(const Duration(seconds: 1));
    await repository.signOut();
    Get.showSnackbar(
      const GetSnackBar(
        duration: Duration(seconds: 1),
        message: 'Logged out',
      ),
    );
  }

  String formatPrice(dynamic target) => _numberFormat.format(target);

  _openDatabase() async {
    await cartsRepository.openDatabase();
  }

  _closeDatabase() async {
    if (cartsRepository.isDatabaseOpen()) {
      await cartsRepository.closeDatabase();
    }
  }

  Future addToCart() async {
    if (!cartsRepository.isDatabaseOpen()) {
      Get.showSnackbar(const GetSnackBar(
        title: 'Error',
        message: 'System not ready, please try again',
        margin: EdgeInsets.all(16.0),
        duration: Duration(seconds: 2),
      ));
    } else {
      selectedProduct.mapOrNull(pure: (value) async {
        Product values = Product.cart(
          productId: value.uuid,
          name: value.name,
          description: value.description,
          category: value.category,
          price: value.price,
          image: value.image,
          userId: _currentUser!.uid,
          quantity: 1,
        );
        await cartsRepository.insert(values).then((value) {
          log(value.toString());
          Get.showSnackbar(const GetSnackBar(
            title: 'Success',
            message: 'Product added to your cart!',
            margin: EdgeInsets.all(16.0),
            duration: Duration(seconds: 3),
          ));
        });
      });
    }
  }
}
