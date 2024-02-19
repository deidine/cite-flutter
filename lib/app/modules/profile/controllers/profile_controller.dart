import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:cite3/app/data/model/user/user_response.dart';
import 'package:cite3/app/data/service/user_service.dart';
import 'package:cite3/app/modules/home/controllers/home_controller.dart';

class ProfileController extends GetxController with StateMixin {
  late UserResponse userProfile;
  final HomeController homeController = Get.find<HomeController>();
  final refreshController = RefreshController();

  @override
  void onInit() {
    intializeUserProfile();

    super.onInit();
  }

  Future<void> refreshProfile() async {
    change(false, status: RxStatus.loading());
    userProfile = await UserService.getUser(homeController.username);
    change(true, status: RxStatus.success());
  }

  void intializeUserProfile() async {
    change(false, status: RxStatus.loading());

    userProfile = await UserService.getUser(homeController.username);

    change(true, status: RxStatus.success());
  }
}
