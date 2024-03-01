import 'dart:convert';
import 'dart:io'; // Import for File class

class VenueRequest {
  String venueName;
  int pricePerHour;
  String location;
  String category;
  double rating;
  File image; // Change the type to dynamic to accept either String or File

  VenueRequest({
    required this.location,
    required this.venueName,
    required this.pricePerHour,
    required this.category,
    required this.rating,
    required this.image,
  });

  Map<String, String> toJson() {
   
    
      return {
        'venueName': venueName,
        'pricePerHour': pricePerHour.toString(),
        'location': location,
        'category': category,
        'rating': rating.toString(),
 
      };
   
  }
}
