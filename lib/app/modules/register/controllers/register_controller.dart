import 'package:cite3/app/data/enum/role_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cite3/app/core/themes/custom_snackbar_theme.dart';
import 'package:cite3/app/data/model/Register/register_request.dart';
import 'package:cite3/app/data/service/register_service.dart';
import 'package:cite3/app/routes/app_pages.dart';

class RegisterController extends GetxController with StateMixin {
  late final TextEditingController fullNameController;
  late final TextEditingController addressController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController emailController;
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void onInit() {
    initializeController();

    change(true, status: RxStatus.success());

    super.onInit();
  }

  void initializeController() {
    fullNameController = TextEditingController();
    addressController = TextEditingController();
    phoneNumberController = TextEditingController();
    emailController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  bool isAnyEmptyField() {
    return fullNameController.text.isEmpty ||
        addressController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        emailController.text.isEmpty ||
        usernameController.text.isEmpty ||
        passwordController.text.isEmpty;
  }

  bool isAllFieldValid() {
    final isNameContainNumber = fullNameController.text.contains(
      RegExp(r'[0-9]'),
    );
    final isValidPhoneNumber =
        int.tryParse(phoneNumberController.text) != null &&
            phoneNumberController.text.length == 12;
    final isValidEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(emailController.text);

    return isValidEmail && isValidPhoneNumber && !isNameContainNumber;
  }

  void handleRegister() async {
    if (isAnyEmptyField()) {
      CustomSnackbar.failedSnackbar(
        title: 'Registration Failed',
        message: 'Please input all fields',
      );
      return;
    }

    if (!isAllFieldValid()) {
      CustomSnackbar.failedSnackbar(
        title: 'Registration Failed',
        message: 'Invalid data',
      );
      return;
    }

    final name = fullNameController.text;
    final address = addressController.text;
    final phoneNumber = phoneNumberController.text;
    final email = emailController.text;
    final username = usernameController.text;
    final password = passwordController.text;

    final request = RegisterRequest(
      name: name,
      address: address,
      phoneNumber: phoneNumber,
      email: email,
      username: username,
      password: password,
      role:'client'
    );

    change(false, status: RxStatus.loading());
    final isSuccess = await RegisterService.register(request);
    change(true, status: RxStatus.success());

    if (isSuccess) {
      CustomSnackbar.successSnackbar(
        title: 'Registration Success',
        message: 'Redirecting to login page',
      );

      Future.delayed(const Duration(seconds: 2), () {
        Get.offNamed(Routes.LOGIN, arguments: true);
      });
      return;
    }

    CustomSnackbar.failedSnackbar(
      title: 'Registration Failed',
      message: 'Username already exist',
    );
  }
    Rx<Role> role = Rx(Role.client); // Set a default role

  late List<String> venues;
 Rx<Role> selectedRole = Role.client.obs; // Initialize with default role

  void updateFilteredRole(Role role) {
    selectedRole.value = role;
  }
  void reloadScreen() {
    update(); // This will force the screen to rebuild
  }
}
