import 'package:cite3/app/data/model/venue/venue_response.dart';
import 'package:cite3/app/data/model/venue/venue_resquest.dart';
import 'package:cite3/app/data/repository/venue_repository.dart';

abstract class VenueService {
  static Future<List<VenueResponse>> getVenues() async {
    print("je suios od0");

    return await VenueRepository.getVenues();
  }

  static Future<VenueResponse> getDetailVenue(String idVenue) async {
    return await VenueRepository.getDetailVenue(idVenue);
  }

  static register(VenueRequest request) async {
     try {
      final result = await VenueRepository.register(request);
      if (result == 201) return true;

      return false;
    } catch (e) {
      throw Exception(e);
    }
  }
}
