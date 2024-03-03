import 'package:get/get.dart';

import '../controllers/all_payment_controller.dart';

class AllpaymentOwnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllpaymentOwnerController>(
      () => AllpaymentOwnerController(),
    );
  }
}
