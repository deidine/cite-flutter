import 'dart:convert';
import 'dart:io';

import 'package:cite3/app/core/themes/custom_snackbar_theme.dart';
import 'package:cite3/app/data/model/venue/venue_resquest.dart';
import 'package:cite3/app/data/service/venue_service.dart';
import 'package:cite3/app/routes/app_pages.dart';
import 'package:cite3/citte_owner/owner_home/controllers/home_owner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AddVenueController extends GetxController with StateMixin {
  late final TextEditingController venueName;
  late final TextEditingController pricePerHour;
  late final TextEditingController category;
  late final TextEditingController location;
  final refreshController = RefreshController();
  final homeController = Get.find<HomeOwnerController>();
  bool starterForm = true;
  late bool proForm = true;

  late File? image;

  @override
  void onInit() {
    homeController.dataUser!.idUser;
    initializeController();
    change(true, status: RxStatus.success());
    super.onInit();
  }

  void setImage(File? pickedImage) {
    image = pickedImage;
    update(); // Notify the UI to rebuild
  }

  void initializeController() {
    venueName = TextEditingController();
    pricePerHour = TextEditingController();
    category = TextEditingController();
    location = TextEditingController();
    image = null; // Initialize image to null
  }

  void clear() {
    venueName.text = '';
    pricePerHour.text = '';
    category.text = '';
    location.text = '';
    image = null; // Initialize image to null
  }

  bool isAnyEmptyField() {
    return venueName.text.isEmpty ||
        pricePerHour.text.isEmpty ||
        category.text.isEmpty ||
        location.text.isEmpty;
  }

  bool isAllFieldValid() {
    // Implement validation logic here if necessary
    return true; // Placeholder return value
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

    final request = VenueRequest(
        userId: homeController.dataUser!.idUser,
        location: location.text,
        venueName: venueName.text,
        pricePerHour: int.parse(pricePerHour.text),
        category: category.text,
        rating: 0.1,
        image: image!,
        status: 'invalid');

    change(false, status: RxStatus.loading());
    final isSuccess = await VenueService.register(request);

    change(true, status: RxStatus.success());

    if (isSuccess) {
      CustomSnackbar.successSnackbar(
        title: 'Registration Success',
        message: 'we will sheck your data and verify it ',
      );
      handleRefresh();
      // clear();
      // Get.back();

      Future.delayed(const Duration(seconds: 2), () {});
      return;
    } else {
      CustomSnackbar.failedSnackbar(
        title: 'Registration Failed',
        message: 'we can\'t insert your cite ',
      );
    }
// clear() ;
  }

  void reloadScreen() {
    update(); // This will force the screen to rebuild
  }

  void handleRefresh() async {
    refreshController.requestRefresh();

    clear();
    print("i am inisilasing");
    reloadScreen();
    refreshController.refreshCompleted();
  }
}
