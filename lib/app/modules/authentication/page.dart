import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_caffee/app/modules/authentication/controller.dart';
import 'package:my_caffee/app/modules/authentication/widgets/login_page_widget.dart';
import 'package:my_caffee/app/modules/authentication/widgets/register_page_widget.dart';

class AuthenticationPage extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [LoginPage(), RegisterPage()],
      ),
    );
  }
}
