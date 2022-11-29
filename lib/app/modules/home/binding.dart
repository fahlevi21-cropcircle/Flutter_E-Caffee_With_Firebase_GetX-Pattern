import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:my_caffee/app/data/providers/api.dart';
import 'package:my_caffee/app/data/providers/firebase/authentication.dart';
import 'package:my_caffee/app/modules/home/repository.dart';
import 'package:my_caffee/core/values/consts.dart';

import 'controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnsplashApi>(() => UnsplashApi());
    Get.lazyPut<FirebaseAuthenticationApi>(
        () => FirebaseAuthenticationApi(firebaseAuth: firebaseAuthInstance));
    Get.lazyPut<HomeController>(
      () => HomeController(
        MainRepository(),
      ),
    );
  }
}
