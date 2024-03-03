import 'package:cite3/app/data/model/payment/payment_response.dart';
import 'package:cite3/app/data/model/payment/payment_resquest.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:cite3/app/data/model/venue/venue_resquest.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:cite3/app/data/provider/api_provider.dart';

import '../model/venue/venue_response.dart';

abstract class PaymentRepository {
  static final getConnect = GetConnect();

  static Future<List<PaymentResponse>> getVenues() async {
    var url = Uri.parse(ApiProvider.getAllVenue);

    final response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    print("la reponse du venu${response}");

    // final List<PaymentResponse> data =response.body['data'];
    List<PaymentResponse> getData = [];
    var _extractedData = json.decode(response.body) as List;
    if (_extractedData == null) {}
    getData = _extractedData
        .map<PaymentResponse>((json) => PaymentResponse.fromJson(json))
        .toList();
    print("je suios od");
    return getData;
  }

    static Future<List<PaymentResponse>> getVenuesByUser() async {
    var url = Uri.parse(ApiProvider.getAllVenue);

    final response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    print("la reponse du venu${response}");

    // final List<PaymentResponse> data =response.body['data'];
    List<PaymentResponse> getData = [];
    var _extractedData = json.decode(response.body) as List;
    if (_extractedData == null) {}
    getData = _extractedData
        .map<PaymentResponse>((json) => PaymentResponse.fromJson(json))
        .toList();
    print("je suios od");
    return getData;
  }

  static Future<PaymentResponse> getDetailVenue(String idVenue) async {
    final url = '${ApiProvider.getDetailPaym}$idVenue';
    final respose = await getConnect.get(url);
    final data = respose.body['data'];

    if (data == null) throw Exception('Venue not found');

    return PaymentResponse.fromJson(data);
  }

  static Future<List<PaymentResponse>> sendSearchQuery(String query) async {
    String backendUrl = '${ApiProvider.searchBooking}';

    try {
      http.Response response =
          await http.post(Uri.parse(backendUrl), body: {'query': query});
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        List<PaymentResponse> reservations =
            jsonData.map((data) => PaymentResponse.fromJson(data)).toList();
        return reservations;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error sending search query: $error');
    }
  }
  static Future<int> register(PaymentRequest paymnet) async {
    try {
      var stream = http.ByteStream(DelegatingStream.typed(paymnet.image.openRead()));
      var length = await paymnet.image.length();

      var uri = Uri.parse(ApiProvider.registerPaym);
      var request = http.MultipartRequest("POST", uri);
      var multipartFile = http.MultipartFile(
        'image',//the same shuld be in backend serliser
        stream,
        length,
        filename: basename(paymnet.image.path),
        // contentType: MediaType('image', 'jpeg'), // Adjust content type as necessary
      );

      //this for others 
      request.fields.addAll(paymnet.toJson());
      //this for image
      request.files.add(multipartFile);
      var response = await request.send();

      print(response.statusCode);
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        print(responseBody);
        return 201;
      } else {
        print(response.reasonPhrase);
        return response.statusCode;
      }
    } catch (e) {
      print('Error uploading image: $e');
      return 400;
    }
  }


  static delete(int id) async {
    final url = '${ApiProvider.deletePaym}$id/'; // Replace with your API endpoint

    try {
      final response = await http.delete(Uri.parse(url));

      if (response.statusCode == 200) {
        // Booking deleted successfully
        print('Booking deleted');
      } else {
        // Error deleting booking
        print('Failed to delete booking: ${response.statusCode}');
      }
    } catch (error) {
      // Handle error
      print('Error deleting booking: $error');
    }
  }
 

    static Future<List<PaymentResponse>> getValidPaymByBookId(int id) async {
    var url = Uri.parse("${ApiProvider.getAllPaymByUserId}$id/");

    final response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    print("la reponse du venu${response}");

    // final List<PaymentResponse> data =response.body['data'];
    List<PaymentResponse> getData = [];
    var _extractedData = json.decode(response.body) as List;
    if (_extractedData == null) {}
    getData = _extractedData
        .map<PaymentResponse>((json) => PaymentResponse.fromJson(json))
        .toList();
    print("je suios od");
    return getData;
  }




  }

