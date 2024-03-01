import 'package:cite3/citte_owner/owner_home/controllers/home_owner_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:cite3/app/data/model/user/user_response.dart';
import 'package:cite3/app/data/service/user_service.dart'; 
class ProfileOwnerController extends GetxController with StateMixin {
  late UserResponse? userProfile;

  final HomeOwnerController homeController = Get.find<HomeOwnerController>();
  final refreshController = RefreshController();

  @override
  void onInit() {
    intializeUserProfile(); 
print("deidine$userProfile");
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
