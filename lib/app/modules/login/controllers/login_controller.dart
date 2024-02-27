import 'package:cite3/app/data/model/Register/register_request.dart';
import 'package:cite3/app/data/model/user/user_response.dart';
import 'package:cite3/app/data/service/user_service.dart';
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
 Future<UserResponse> getDataUser(String username) async {
 UserResponse? dataUser;

    print("data user function");
    dataUser = await UserService.getUser(username);
    return dataUser;
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

      // UserResponse cred =
      //     await getDataUser(inputtedUsername);
    change(false, status: RxStatus.loading());
    final isValid =
        await LoginService.login(inputtedUsername, inputtedPassword);
    change(true, status: RxStatus.success());

    if (isValid ?? false) { 
//     if (cred.role == "client") {
//       //! get type if type==user then show user ui otherwise show doctor ui

//            Get.offAllNamed(Routes.HOME, arguments: inputtedUsername);

//     } else if (cred.role == "owner") {
//            Get.offAllNamed(Routes.HOME, arguments: inputtedUsername);
//  }
           Get.offAllNamed(Routes.HOMEOWNER, arguments: inputtedUsername);

      return;
    }

    CustomSnackbar.failedSnackbar(
      title: 'Failed',
      message: 'Wrong username or password',
    );
  }
}
