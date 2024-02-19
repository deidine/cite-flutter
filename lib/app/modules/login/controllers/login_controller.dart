import 'package:cite3/app/data/model/Register/register_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cite3/app/core/themes/custom_snackbar_theme.dart';
import 'package:cite3/app/data/model/login/login_request.dart';
import 'package:cite3/app/data/service/login_service.dart';
import 'package:cite3/app/routes/app_pages.dart';

class LoginController extends GetxController with StateMixin {
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void onInit() {
    intializeController();
    change(true, status: RxStatus.success());

    super.onInit();
  }

  void intializeController() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  void handleLogin() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      CustomSnackbar.failedSnackbar(
        title: 'Failed',
        message: 'Please input username and password',
      );
      return;
    }

    final inputtedUsername = usernameController.text;
    final inputtedPassword = passwordController.text;

    final loginRequest = RegisterRequest(
      username: inputtedUsername,
      password: inputtedPassword,
    );

    change(false, status: RxStatus.loading());
    final isValid = await LoginService.login(inputtedUsername,inputtedPassword);
    change(true, status: RxStatus.success());

    if (isValid) {
      Get.offAllNamed(Routes.HOME, arguments: inputtedUsername);
      return;
    }

    CustomSnackbar.failedSnackbar(
      title: 'Failed',
      message: 'Wrong username or password',
    );
  }
}
