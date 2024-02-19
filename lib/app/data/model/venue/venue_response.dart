import 'package:cite3/app/data/enum/venue_category_enum.dart';

class VenueResponse {
  int idVenue;
  String venueName;
  int pricePerHour;
  String location;
  VenueCategory category;
  double rating;
  String image;

  VenueResponse({
    required this.idVenue,
    required this.location,
    required this.venueName,
    required this.pricePerHour,
    required this.category,
    required this.rating,
    required this.image,
  });

  factory VenueResponse.fromJson(Map<String, dynamic> json) {
    VenueCategory category = VenueCategory.basket;

    switch (json['category']) {
      case 'futsal':
        category = VenueCategory.futsal;
        break;

      case 'basket':
        category = VenueCategory.basket;
        break;

      case 'mini soccer':
        category = VenueCategory.miniSoccer;
        break;

      case 'football':
        category = VenueCategory.footbal;
        break;
    }

    return VenueResponse(
      idVenue:  json['venueId_id'] ,
      venueName: json['venueName'],
      pricePerHour:  json['pricePerHour'] ,
      location: json['location'],
      category: category,
      rating: double.parse(json['rating']),
      image: json['image'],
    );
  }
}
