import 'dart:io'; // Import for File class
import 'package:cite3/app/data/enum/venue_category_enum.dart';

class PaymentResponse {
  int? pymId;
  int bookinId,phone;
  String bankApp,status;
  String solde;

  String pymtTime; 
  File? image;
 
  PaymentResponse({
     this.pymId,
    required this.phone,
    required this.solde,
    required this.bookinId,
    required this.pymtTime,
    required this.status,
    required this.bankApp,
      this.image,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) {
    
    return PaymentResponse(
      pymId:  json['pymId'] ,
      phone:  json['phone']  ,
      solde:  json['solde'] ,
      bookinId: json['bookinId']  ,
      pymtTime:  json['pymtTime'] ,
      status: json['status'],
      bankApp: json['bankApp'],
      // image: json['image'],// this will be in multipart
    );
  }
}
