import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_caffee/core/values/consts.dart';
import 'package:my_caffee/routes/pages.dart';

class GuestMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (firebaseAuthInstance.currentUser != null) {
      return RouteSettings(name: Routes.DASHBOARD);
    }
  }
}
