import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cite3/app/data/model/user/user_response.dart';
import 'package:cite3/app/data/service/user_service.dart';
import 'package:cite3/citte_owner/add_venue/views/add_venue_view.dart';
import 'package:cite3/citte_owner/all_venue/views/all_venue_view.dart'; 

class HomeOwnerController extends GetxController {
  final String username = Get.arguments;
  late UserResponse? dataUser;
  late UserResponse? userProfile;

  var pageIndex = 0.obs;
  var pageController = PageController(initialPage: 0);
  var isSlide = false.obs;

  @override
  void onInit() {
    getDataUser();
    super.onInit();
  }

  void getDataUser() async {
    try {
      userProfile = await UserService.getUser(username);
      dataUser = await UserService.getUserById(userProfile!.idUser);
      print("$dataUser.address");
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  List<Widget> pages = [
     AllOwnerVenueView(),
    AddVenueView(),
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
