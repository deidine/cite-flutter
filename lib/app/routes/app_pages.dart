import 'dart:ui';
 
import 'package:cite3/app/modules/payment/binding/payment_binding.dart';
import 'package:cite3/app/modules/payment/views/payment_view.dart';
import 'package:cite3/citte_owner/OwnerHomePage.dart';
import 'package:cite3/citte_owner/add_venue/binding/add_venue_binding.dart';
import 'package:cite3/citte_owner/add_venue/views/add_venue_view.dart';
import 'package:cite3/citte_owner/all_booking/bindings/all_booking_binding.dart';
import 'package:cite3/citte_owner/all_booking/views/all_booking_view.dart';
import 'package:cite3/citte_owner/all_booking/views/booking_detail.dart';
import 'package:cite3/citte_owner/all_payment/bindings/all_venue_binding.dart';
import 'package:cite3/citte_owner/all_payment/views/all_payment_view.dart';
import 'package:cite3/citte_owner/all_venue/bindings/all_venue_binding.dart';
import 'package:cite3/citte_owner/all_venue/views/all_venue_view.dart';
import 'package:cite3/citte_owner/owner_home/bindings/home_owner_binding.dart';
import 'package:cite3/citte_owner/profileOwner/views/profile_owner_view.dart';
import 'package:cite3/citte_owner/owner_home/views/home_owner_view.dart';
import 'package:cite3/citte_owner/profileOwner/bindings/profile_owner_binding.dart';
import 'package:get/get.dart';

import '../modules/active_booking/bindings/active_booking_binding.dart';
import '../modules/active_booking/views/active_booking_view.dart';
import '../modules/all_venue/bindings/all_venue_binding.dart';
import '../modules/all_venue/views/all_venue_view.dart';
import '../modules/booking_field/bindings/booking_field_binding.dart';
import '../modules/booking_field/views/booking_field_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/history_booking/bindings/history_booking_binding.dart';
import '../modules/history_booking/views/history_booking_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL =Routes.dock;
  static const INITIAL = Routes.ONBOARDING;

  static final routes = [
    GetPage(
      name: _Paths.HOMEOWNER,
      page: () => const HomeOwnerView(),
      // binding: HomeBinding(),
      bindings: [
        HomeOwnerBinding(),
        // AllpaymentOwnerBinding(),
        ProfileOwnerBinding(),
        AddVenueBinding(),
        AllVenueOwnerBinding(),

      ],
    ), GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      // binding: HomeBinding(),
      bindings: [
        HomeBinding(),
        ActiveBookingBinding(),
        HistoryBookingBinding(),
        ProfileBinding(),
        AllVenueBinding(),
      ],
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),   
    // GetPage(
    //   name: _Paths.doc,
    //   page: () => const  OwnerHomePage(  ),
    // ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () =>   RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
     GetPage(
      name: _Paths.PROFILEOWNER,
      page: () => const ProfileOwnerView(),
      binding: ProfileOwnerBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY_BOOKING,
      page: () => const HistoryBookingView(),
      binding: HistoryBookingBinding(),
    ),
    GetPage(
      name: _Paths.ALL_VENUE_OWNER,
      page: () =>     const AllVenueView(),

      binding: AllVenueBinding(),
    ),
    GetPage(
      name: _Paths.ALL_VENUE,
      page: () => const AllOwnerVenueView(),
      binding: AllVenueOwnerBinding(),
    ),
     GetPage(
      name: _Paths.ADD_VENUE,
      page: () =>   AddVenueView(),
      binding: AddVenueBinding(),
    ),
    
    GetPage(
      name: _Paths.ACTIVE_BOOKING,
      page: () => const ActiveBookingView(),
      binding: ActiveBookingBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_FIELD,
      page: () =>   BookingFieldView(),
      binding: BookingFieldBinding(),
    ),
   
    GetPage(
      name: _Paths.BOOKING_DETAIL,
      page: () =>   BookingDetailView(),
      binding: AllBookingBinding(),
    ),GetPage(
      name: _Paths.ALL_BOOKING_OWNER,
      page: () =>   AllBookingView(),
      binding: AllBookingBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const  PaymentView(),
      binding: PaymentBinding(),
    ), GetPage(
      name: _Paths.ALLPAYMENT,
      page: () => const  AllOwnerpayment(),
      binding: AllpaymentOwnerBinding(),
    )
  ];
}
