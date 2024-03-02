import 'dart:convert';
import 'dart:io'; // Import for File class

class VenueRequest {
  String venueName;
  int userId;
  int pricePerHour;
  String location;
  String category;
  String status;
  double rating;
  File image; // Change the type to dynamic to accept either String or File

  VenueRequest({
    required this.userId,
    required this.location,
    required this.venueName,
    required this.pricePerHour,
    required this.category,
    required this.rating,
    required this.image,
    required this.status,
  });

  Map<String, String> toJson() {
   
    
      return {
        'userId':userId.toString(),
        'venueName': venueName,
        'pricePerHour': pricePerHour.toString(),
        'location': location,
        'category': category,
        'rating': rating.toString(),
 'status':status
      };
   
  }
}
