import 'package:cite3/app/core/themes/custom_snackbar_theme.dart';
import 'package:cite3/app/data/enum/venue_category_enum.dart';
import 'package:cite3/app/data/model/payment/payment_response.dart';
import 'package:cite3/app/data/model/reservation/reservation_response.dart';
import 'package:cite3/app/data/service/payment_service.dart';
import 'package:cite3/citte_owner/owner_home/controllers/home_owner_controller.dart';
import 'package:get/get.dart'; 
import 'package:cite3/app/data/model/venue/venue_response.dart';
import 'package:cite3/app/data/service/venue_service.dart';
import 'package:cite3/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AllpaymentOwnerController extends GetxController with StateMixin {
  late List<PaymentResponse>? payments = [];
  var paymentsobs = <PaymentResponse>[].obs;
  final refreshController = RefreshController();

late ReservationResponse infoBooking ;
  late final homeController = Get.find<HomeOwnerController>();
  late int? iduser;
  var deletedId;
  
  @override
  void onInit()  {
    iduser = homeController.dataUser!.idUser;
     parsingArgument();
    fetchData();
    super.onInit();
    print("defined");
  }

  VenueResponse getDetailVenue() {
    VenueResponse? infoVenue = Get.arguments?['infoVenue'];
    return infoVenue ?? VenueResponse(venueName: '',rating: 0.1,category: VenueCategory.footbal,idVenue: 1,image: '',location: '',pricePerHour: 2); // Return a default VenueResponse if infoVenue is null
  }

  void toBookingFieldPage(VenueResponse venue) {
    if (homeController.dataUser == null) {
      return;
    }

    final arguments = {
      'infoVenue': venue,
      'isEditReservation': false,
      'transactionId': 0,
    };
    Get.toNamed(Routes.BOOKING_DETAIL, arguments: arguments);
 
  }

  void handleDeleteBookingField() async {
    change(false, status: RxStatus.loading());
    print("defined $deletedId");
    dynamic resp = await PaymentService.delete(deletedId);
    print("defined2 $resp");

    CustomSnackbar.successSnackbar(
      title: 'Success',
      message: 'Success edit Booking',
    );
    fetchData();
    change(true, status: RxStatus.success());
  }

  void fetchData() async {
    change(false, status: RxStatus.loading());
    payments = await PaymentService.getValidPaymByBookId( infoBooking.transactionId!);
    paymentsobs.value=payments!;
    print("Got payments: $payments");
    change(true, status: RxStatus.success());
  }

  void handleRefresh() async {
    refreshController.requestRefresh();
    fetchData();
    refreshController.refreshCompleted();
  } 

  void parsingArgument() {
     infoBooking = Get.arguments['infoBooking']; 
  }

}
