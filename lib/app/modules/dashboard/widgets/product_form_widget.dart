import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_caffee/app/data/models/products/product/product.dart';
import 'package:my_caffee/app/modules/dashboard/controller.dart';

class ProductForm extends StatelessWidget {
  ProductForm({super.key});

  final DashboardController controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: Get.theme.primaryColor,
          ),
        ),
        backgroundColor: Get.theme.cardColor,
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Material(
            color: Get.theme.cardColor,
            child: SingleChildScrollView(
              padding: const EdgeInsetsDirectional.only(
                start: 24,
                end: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create new product',
                    style: Get.textTheme.headline4,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  TextFormField(
                    controller: controller.productNameTextController,
                    decoration: InputDecoration(
                      labelText: 'Product Name',
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: controller.productDescriptionTextController,
                    decoration: InputDecoration(
                      labelText: 'Product Description',
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.productPriceTextController,
                          decoration: InputDecoration(
                            prefixText: 'Rp.',
                            labelText: 'Price',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.productCategoryTextController,
                          decoration: InputDecoration(
                            labelText: 'Category',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(
                          () => ElevatedButton.icon(
                            onPressed: controller.submittingData
                                ? null
                                : () => controller.createProduct(
                                        product: Product.pure(
                                      uuid: 'qwease',
                                      name: controller
                                          .productNameTextController.text,
                                      price: double.tryParse(controller
                                          .productPriceTextController.text),
                                      image: 'asdasdasd',
                                    )),
                            icon: controller.submittingData
                                ? SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : Icon(Icons.check),
                            label: Text('Submit'),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
