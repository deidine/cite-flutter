import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:cite3/app/data/provider/api_provider.dart';

import '../model/venue/venue_response.dart';

abstract class VenueRepository {
  static final getConnect = GetConnect();

  static Future<List<VenueResponse>> getVenues() async {
    var url =
        Uri.parse(ApiProvider.getAllVenue);

    final response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    print("la reponse du venu${response}");

    // final List<VenueResponse> data =response.body['data'];
    List<VenueResponse> getData = [];
    var _extractedData = json.decode(response.body) as List;
    if (_extractedData == null) {}
    getData = _extractedData
        .map<VenueResponse>((json) => VenueResponse.fromJson(json))
        .toList();
    print("je suios od");
    return getData;
  }
 

  static Future<VenueResponse> getDetailVenue(String idVenue) async {
    final url = '${ApiProvider.getDetailVenue}$idVenue';
    final respose = await getConnect.get(url);
    final data = respose.body['data'];

    if (data == null) throw Exception('Venue not found');

    return VenueResponse.fromJson(data);
  }
}
