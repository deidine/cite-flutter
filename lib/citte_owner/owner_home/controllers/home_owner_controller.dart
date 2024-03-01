import 'package:cite3/app/data/service/user_service.dart';
import 'package:cite3/app/modules/all_venue/views/all_venue_view.dart';
import 'package:cite3/app/modules/profile/views/profile_view.dart';
import 'package:cite3/citte_owner/add_venue/views/add_venue_view.dart';
import 'package:cite3/citte_owner/all_booking/views/all_booking_view.dart';
import 'package:cite3/citte_owner/all_venue/views/all_venue_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cite3/app/data/model/user/user_response.dart';

 
class HomeOwnerController extends GetxController {
  final String username = Get.arguments;
   UserResponse? dataUser;
//  late UserResponse? dataUser;

  var pageIndex = 0.obs;
  var pageController = PageController(initialPage: 0);
  var bySlide = false.obs;

  @override
  void onInit() {
    getDataUser();

    super.onInit();
  }

  void getDataUser() async {
    print("data user function");
    dataUser = await UserService.getUserById(1);
    print("$dataUser.address");
  }

  List<Widget> pages = [
      AllBookingView(),
      AddVenueView(),
      AllOwnerVenueView(),
    // const ActiveBookingView(),
    // const HistoryBookingView(),
 
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
