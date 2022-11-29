import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_caffee/core/values/consts.dart';
import 'package:my_caffee/routes/pages.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (firebaseAuthInstance.currentUser == null) {
      Get.showSnackbar(
        GetSnackBar(
          duration: Duration(milliseconds: 600),
          message: 'You must logged in to continue',
        ),
      );
      return RouteSettings(name: Routes.AUTH);
    }
  }
}
