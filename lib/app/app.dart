import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_caffee/core/values/consts.dart';
import 'package:my_caffee/routes/pages.dart';
import 'package:my_caffee/core/theme/app_theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.AUTH,
      theme: appThemeData,
      darkTheme: appDarkThemeData,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      onReady: () {
        firebaseAuthInstance.authStateChanges().listen((user) {
          if (user == null && Get.currentRoute != Routes.AUTH) {
            Get.offAndToNamed(Routes.AUTH);
          }
        });
      },
    );
  }
}
