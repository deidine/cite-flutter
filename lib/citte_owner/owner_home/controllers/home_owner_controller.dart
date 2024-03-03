import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cite3/app/data/model/user/user_response.dart';
import 'package:cite3/app/data/service/user_service.dart';
import 'package:cite3/citte_owner/add_venue/views/add_venue_view.dart';
import 'package:cite3/citte_owner/all_venue/views/all_venue_view.dart'; 

class HomeOwnerController extends GetxController {
  late final String? username  ;
    UserResponse? dataUser;
  var pageIndex = 0.obs;
  var pageController = PageController(initialPage: 0);
  var isSlide = false.obs;

  @override
  void onInit() {
    getDataUser();
    super.onInit();
  }

  void getDataUser() async {
      username = Get.arguments['username'];
    dataUser=Get.arguments['infoUser'];

    
  }

  List<Widget> pages = [
     AllOwnerVenueView(),
    AddVenueView(),
    // AllOwnerpayment()
  ];

  void changePageBySlide(int index) {
    pageIndex.value = index;
  }

  void changePage(int index) {
    pageController.animateToPage(
      index,
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: 170),
    );
    pageIndex.value = index;
  }
}
