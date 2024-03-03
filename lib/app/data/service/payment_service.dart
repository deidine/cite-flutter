import 'package:cite3/app/data/model/payment/payment_response.dart';
import 'package:cite3/app/data/model/payment/payment_resquest.dart';
import 'package:cite3/app/data/model/venue/venue_response.dart';
import 'package:cite3/app/data/model/venue/venue_resquest.dart';
import 'package:cite3/app/data/repository/payment_repository.dart';
import 'package:cite3/app/data/repository/venue_repository.dart';

abstract class PaymentService {
  static Future<List<PaymentResponse>> getVenues() async {
    print("je suios od0");

    return await PaymentRepository.getVenues();
  }
  static Future<List<PaymentResponse>> getVenuesByUser() async {
    print("je suios od0");

    return await PaymentRepository.getVenuesByUser();
  }
  static Future<PaymentResponse> getDetailVenue(String idVenue) async {
    return await PaymentRepository.getDetailVenue(idVenue);
  }

  static register(PaymentRequest request) async {
     try {
      final result = await PaymentRepository.register(request);
      if (result == 201) return true;

      return false;
    } catch (e) {
      throw Exception(e);
    }
  }



  static delete(int id) async{
    try {
     await PaymentRepository.delete(id);
  } catch (e) {
    // Handle the error properly
    print('Failed to delete booking: $e'); 
  }
  }
  
    static Future<List<PaymentResponse>> getValidPaymByBookId(int id) async {
    print("je suios od0");

    return await PaymentRepository.getValidPaymByBookId(id);
  }
  
  
  }
