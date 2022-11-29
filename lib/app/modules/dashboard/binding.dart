import 'package:get/get.dart';
import 'package:my_caffee/app/data/providers/firebase/authentication.dart';
import 'package:my_caffee/app/data/providers/firebase/database.dart';
import 'package:my_caffee/app/data/providers/local/database.dart';
import 'package:my_caffee/app/modules/cart/repository.dart';
import 'package:my_caffee/app/modules/dashboard/repository.dart';
import 'package:my_caffee/core/values/consts.dart';

import 'controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(
        repository: DashboardRepository(
          databaseApi:
              FirebaseDatabaseApi(parent: firebaseDatabaseInstance.ref()),
          authenticationApi:
              FirebaseAuthenticationApi(firebaseAuth: firebaseAuthInstance),
          localDatabaseApi: LocalDatabaseApi(),
        ),
        imagePath: firebaseStorageInstance.ref(),
        cartsRepository: CartsRepository(localDatabaseApi: LocalDatabaseApi()),
      ),
    );
  }
}
