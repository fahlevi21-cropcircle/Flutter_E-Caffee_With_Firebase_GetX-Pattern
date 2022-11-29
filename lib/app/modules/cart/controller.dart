import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_caffee/app/data/models/products/product/product.dart';
import 'package:my_caffee/app/modules/cart/repository.dart';

class CartsController extends GetxController {
  final CartsRepository repository;
  CartsController({
    required this.repository,
  });

  final _carts = <Product>[].obs;
  set carts(value) => this._carts.value = value;
  List<Product> get carts => this._carts.value;

  final _loading = false.obs;
  set loading(value) => this._loading.value = value;
  bool get loading => this._loading.value;

  @override
  void onInit() {
    _openDatabase();
    super.onInit();
  }

  Future _openDatabase() async {
    await repository.openDatabase().then((value) {
      getAll();
    });
  }

  _closeDatabase() async {
    if (repository.isDatabaseOpen()) {
      await repository.closeDatabase();
    }
  }

  _testInsert() async {
    Product testProduct = const Product.cart(
      productId: 'asdasd',
      name: 'aasdasd',
      price: 345.33,
      image: 'asdasd',
      category: 'asdasd',
      description: 'asdasdasd',
      quantity: 1,
      userId: 'asdasdasd',
    );

    await repository.insert(testProduct);
  }

  Future getAll() async {
    loading = true;
    carts = <Product>[];
    try {
      // array of map (iterable map)
      var result = await repository.getAll() as List<Map<String, dynamic>>;
      if (result.isNotEmpty) {
        for (var i = 0; i < result.length; i++) {
          var item = Map.of(result[i]);
          item["runtimeType"] = 'cart';
          carts.addIf(item.isNotEmpty, Product.fromJson(item));
        }
      }
      loading = false;
    } catch (e) {
      Get.log(e.toString(), isError: true);
      loading = false;
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: e.toString(),
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(16.0),
      ));
    }
  }

  delete(int id) async {
    await repository.delete(id).then((value) {
      getAll();
    });
  }
}
