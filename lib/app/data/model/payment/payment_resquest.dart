import 'dart:convert';
import 'dart:io'; // Import for File class

class PaymentRequest {
  int? pymId;
  int bookinId,phone;
  String bankApp,status;
  double solde;

  String pymtTime; 
  File image;
 
  PaymentRequest({
    //  this.pymId,
    required this.phone,
    required this.solde,
    required this.bookinId,
    required this.pymtTime,
    required this.status,
    required this.bankApp,
     required this.image,
  });

  Map<String, String> toJson() {
   
     
        return {

      
      // 'pymId':  pymId.toString() ,
      'phone':  phone.toString() ,
      'solde':  solde.toString() ,
      'bookinId': bookinId.toString(),
      'pymtTime':  pymtTime.toString() ,
      'status': status.toString(),
      'bankApp': bankApp.toString(),
      // 'image': image.toString(),// this will be in multipart
      };
       
   
  }
}
