import 'package:get/get.dart';
import 'package:my_caffee/app/data/providers/local/database.dart';
import 'package:my_caffee/app/modules/cart/repository.dart';

import 'controller.dart';

class CartsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartsController>(
      () => CartsController(
        repository: CartsRepository(
          localDatabaseApi: LocalDatabaseApi(),
        ),
      ),
    );
  }
}
