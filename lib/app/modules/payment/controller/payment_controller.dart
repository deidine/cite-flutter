import 'dart:io';

import 'package:cite3/app/core/themes/custom_snackbar_theme.dart';
import 'package:cite3/app/data/model/payment/payment_resquest.dart';
import 'package:cite3/app/data/model/venue/venue_response.dart';
import 'package:cite3/app/data/service/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PaymentController extends GetxController with StateMixin {
   late final VenueResponse infoVenue; 
  late final int transactionId;

 
 
  late final TextEditingController bankApp;
  late final TextEditingController phone;
  late final TextEditingController solde;

  final refreshController = RefreshController(); 
  bool starterForm = true;
  late bool proForm = true;

  late File? image;

  @override
  void onInit() { 
    initializeController();
    parsingArgument() ;
    change(true, status: RxStatus.success());
    super.onInit();
  }

  void setImage(File? pickedImage) {
    image = pickedImage;
    update(); // Notify the UI to rebuild
  }

  void initializeController() {
    bankApp = TextEditingController();
    phone = TextEditingController();
    solde = TextEditingController();
    image = null; // Initialize image to null
  }

  void clear() {
    bankApp.text = '';
    phone.text = '';
    solde.text = '';
    image = null; // Initialize image to null
  }

  bool isAnyEmptyField() {
    return bankApp.text.isEmpty || phone.text.isEmpty || solde.text.isEmpty;
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
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    final bookingTime = dateFormat.format(DateTime.now());

    final request = PaymentRequest(
        bookinId: transactionId ,
        pymtTime: bookingTime,
        bankApp: bankApp.text,
        phone: int.parse(phone.text),
        solde: double.parse(solde.text),
        image: image!,
        status: 'invalid');

    change(false, status: RxStatus.loading());
    final isSuccess = await PaymentService.register(request);

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

void parsingArgument() {
    infoVenue = Get.arguments['infoVenue']; 

    transactionId = Get.arguments['transactionId'];
  }
}
