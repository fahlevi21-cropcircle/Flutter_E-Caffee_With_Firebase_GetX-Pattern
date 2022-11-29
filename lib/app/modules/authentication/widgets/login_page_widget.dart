import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_caffee/app/modules/authentication/controller.dart';

class LoginPage extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Obx(
          () => Column(
            children: [
              TextFormField(
                  onChanged: (value) {
                    controller.email = value;
                    controller.checkValidity();
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                    errorText: controller.emailValid ? null : 'Email not valid',
                  )),
              SizedBox(
                height: 32.0,
              ),
              TextFormField(
                obscureText: true,
                onChanged: (value) {
                  controller.password = value;
                  controller.checkValidity();
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    errorText:
                        controller.passwordValid ? null : 'Password not valid'),
              ),
              SizedBox(
                height: 32.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed:
                            controller.valid || !controller.submittingData
                                ? () => controller.signInWithEmailAndPassword()
                                : null,
                        child: controller.submittingData
                            ? SizedBox(
                                height: 24,
                                width: 24,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Text('SIGN IN')),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
