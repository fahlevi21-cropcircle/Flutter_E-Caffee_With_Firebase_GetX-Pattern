import 'package:get/get.dart';
import 'package:my_caffee/app/data/providers/firebase/authentication.dart';
import 'package:my_caffee/app/modules/authentication/controller.dart';
import 'package:my_caffee/app/modules/authentication/repository.dart';
import 'package:my_caffee/core/values/consts.dart';

class AuthenticationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationController>(
      () => AuthenticationController(
        AuthenticationRepository(
          FirebaseAuthenticationApi(
            firebaseAuth: firebaseAuthInstance,
          ),
        ),
      ),
    );
  }
}
