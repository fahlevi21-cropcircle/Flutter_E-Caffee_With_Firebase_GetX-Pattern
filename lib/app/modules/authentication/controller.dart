import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_caffee/app/modules/home/page.dart';
import 'package:my_caffee/app/modules/authentication/repository.dart';
import 'package:my_caffee/routes/pages.dart';

class AuthenticationController extends GetxController {
  final AuthenticationRepository repository;
  AuthenticationController(this.repository);

  final _email = ''.obs;
  set email(value) => this._email.value = value;
  String get email => this._email.value;

  final _password = ''.obs;
  set password(value) => this._password.value = value;
  String get password => this._password.value;

  final _valid = false.obs;
  set valid(value) => this._valid.value = value;
  bool get valid => this._valid.value;

  final _emailValid = true.obs;
  set emailValid(value) => this._emailValid.value = value;
  bool get emailValid => this._emailValid.value;

  final _passwordValid = true.obs;
  set passwordValid(value) => this._passwordValid.value = value;
  bool get passwordValid => this._passwordValid.value;

  final _submittingData = false.obs;
  set submittingData(value) => this._submittingData.value = value;
  bool get submittingData => this._submittingData.value;

  signInWithEmailAndPassword() async {
    try {
      submittingData = true;
      var result = await repository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      submittingData = false;

      if (result.user != null) {
        Get.offAndToNamed(Routes.DASHBOARD);
        Get.showSnackbar(
          GetSnackBar(
            duration: Duration(seconds: 3),
            message: 'Logged in successfully',
          ),
        );
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
      submittingData = false;
    }
  }

  register() async {
    submittingData = true;
    await repository
        .registerWithEmailAndPassword(email: email, password: password)
        .then((value) {
      if (value.user != null) {
        Get.showSnackbar(
          GetSnackBar(
            duration: Duration(seconds: 3),
            message: 'Logged in successfully',
          ),
        );
      }
      submittingData = false;
    });
  }

  checkValidity() {
    emailValid = GetUtils.isEmail(email);
    passwordValid = GetUtils.isLengthGreaterOrEqual(password, 6);
    valid = emailValid && passwordValid;
  }
}
