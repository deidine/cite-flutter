import 'package:cite3/app/core/themes/custom_snackbar_theme.dart';
import 'package:cite3/app/data/enum/venue_category_enum.dart';
import 'package:cite3/app/data/model/user/user_response.dart';
import 'package:cite3/citte_owner/owner_home/controllers/home_owner_controller.dart';
import 'package:get/get.dart'; 
import 'package:cite3/app/data/model/venue/venue_response.dart';
import 'package:cite3/app/data/service/venue_service.dart';
import 'package:cite3/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AllVenueOwnerController extends GetxController with StateMixin {
  late List<VenueResponse>? venues  ;
  final refreshController = RefreshController();

  var filteredVenues = <VenueResponse>[].obs;
     HomeOwnerController? homeController= Get.find<HomeOwnerController>(); 
    UserResponse? dataUser;

    late int  iduser;
  var deletedId;
  // https://vscode.dev/github/deidine/cite-flutter/blob/main/lib/citte_owner/all_payment/controllers
  @override
  void onInit()  {    

    iduser = homeController!.dataUser!.idUser;
    fetchData(iduser);
     super.onInit();
    print("defined");
  }

  VenueResponse getDetailVenue() {
    VenueResponse? infoVenue = Get.arguments?['infoVenue'];
    return infoVenue ?? VenueResponse(venueName: '',rating: 0.1,category: VenueCategory.footbal,idVenue: 1,image: '',location: '',pricePerHour: 2); // Return a default VenueResponse if infoVenue is null
  }

  void toBookingFieldPage(VenueResponse venue) {
    if (homeController?.dataUser == null) {
      return;
    }

    final arguments = {
      'infoVenue': venue,
      'isEditReservation': false,
      'transactionId': 0,
    };

    Get.toNamed(Routes.ALL_BOOKING_OWNER, arguments: arguments);
  }

  void handleDeleteBookingField() async {
    change(false, status: RxStatus.loading());
    print("defined $deletedId");
    dynamic resp = await VenueService.delete(deletedId);
    print("defined2 $resp");

    CustomSnackbar.successSnackbar(
      title: 'Success',
      message: 'Success edit Booking',
    );
    fetchData(iduser!);
    change(true, status: RxStatus.success());
  }

  void fetchData(int userid) async {
    change(false, status: RxStatus.loading());
    venues = await VenueService.getVenuesByUserId(userid);
    print("Got venues: $venues");
    change(true, status: RxStatus.success());
  }

  void handleRefresh() async {
    refreshController.requestRefresh();
    fetchData(iduser!);
    refreshController.refreshCompleted();
  } 
}
