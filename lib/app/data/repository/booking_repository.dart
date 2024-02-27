import 'package:cite3/app/data/model/user/user_response.dart';
import 'package:cite3/app/data/model/venue/venue_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:cite3/app/data/model/reservation/reservation_response.dart';
import 'package:cite3/app/data/model/reservation/schedule_request.dart';
import 'package:cite3/app/data/provider/api_provider.dart';

abstract class BookingRepository {
  static final getConnect = GetConnect();

  static Future<List<int>> getSchedule(ScheduleRequest request) async {
    print("booking function$request");

    // return req.body['data'].cast<int>();

    var url = Uri.parse(
        '${ApiProvider.getSchedule}?venue=${request.venueId}&date=${request.date}');

    final req = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    List<int> getData = [];

// Decode the JSON response body
    var _extractedData = json.decode(req.body);

// Check if the decoded data is not null and is a map
    if (_extractedData != null && _extractedData is Map<String, dynamic>) {
      // Extract the 'hours' field from the decoded data
      dynamic hoursData = _extractedData['hours'];

      // Check if the 'hours' field is not null and is an int
      if (hoursData != null && hoursData is int) {
        getData.add(hoursData); // Add the 'hours' value to the list
      }
    }

    return getData;
  }

  static Future<List<ReservationResponse>> getReservationListByUserId(
      int userId) async {
    var url = Uri.parse('${ApiProvider.getReservationById}$userId/');

    final response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    print("la reponse du venu${response}");

    // final List<VenueResponse> data =response.body['data'];
    List<ReservationResponse> getData = [];
    var _extractedData = json.decode(response.body) as List;
    if (_extractedData == null) {}
    getData = _extractedData
        .map<ReservationResponse>((json) => ReservationResponse.fromJson(json))
        .toList();
    print("je suios od");
    return getData;
  } 
  static Future<List<ReservationResponse>> getReservationListByVenueId(
      int venueId) async {
    var url = Uri.parse('${ApiProvider.getReservationByVenueId}$venueId/');

    final response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    print("la reponse du venu${response}");

    // final List<VenueResponse> data =response.body['data'];
    List<ReservationResponse> getData = [];
    var _extractedData = json.decode(response.body) as List;
    if (_extractedData == null) {}
    getData = _extractedData
        .map<ReservationResponse>((json) => ReservationResponse.fromJson(json))
        .toList();
    print("je suios od");
    return getData;
  }

  static Future<void> cancelReservation(String idTransaction) async {
    try {
      final url = '${ApiProvider.cancelReservation}$idTransaction';

      await getConnect.delete(url);
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> createReservation(ReservationResponse request) async {
    Response<dynamic> req;

    try {
      req = await getConnect.post(
          ApiProvider.createReservation, request.createReservationToJson());
      print(req.statusCode);
      print(req);
      if (req.statusCode == 201) {
        // Successfully created
        print('reservetion created successfully');
        // return 201;
      } else {
        // Failed to create
        print('Failed to create reservation');
        // return 400;
      }
      // return RegisterResponse.fromJson(req.body);
    } catch (e) {
      throw Exception('Failed to send request');
    }
  }

  static Future<void> updateReservation(ReservationResponse request) async {
    try {
      const url = ApiProvider.updateReservation;
      await getConnect.put(url, request.updateReservationToJson());
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<List<int>> getScheduleExcludeTxId(
      ScheduleRequest request) async {
    //   return req.body['data'].cast<int>();
    // }
    var url = Uri.parse(
        '${ApiProvider.getScheduleExcludeTxId}?venue=${request.venueId}&date=${request.date}&txId=${request.txId}');

    final req = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    print("la reponse du venu${req}");

    // final List<int> data =response.body['data'];
    List<int> getData = [];
    var _extractedData = json.decode(req.body) as List<int>;
    if (_extractedData == null) {}
    getData = _extractedData.toList();
    print("je suios od$getData");
    return getData;
  }



    static Future<List<UserResponse>> getUsers() async {

    var url = Uri.parse('${ApiProvider.getUsers}');

    final response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    print("la reponse du venu${response}");

    // final List<VenueResponse> data =response.body['data'];
    List<UserResponse> getData = [];
    var _extractedData = json.decode(response.body) as List;
    if (_extractedData == null) {}
    getData = _extractedData
        .map<UserResponse>((json) => UserResponse.fromJson(json))
        .toList();
    print("je suios od");
    return getData;

}

  static updateStatus(ReservationResponse booking,int id)async {
      try {
    Uri url = Uri.parse('${ApiProvider.updateBookingStatus}$id/');
    // String csrfToken = await fetchCSRFToken();
 
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      // 'X-CSRFToken': csrfToken,
    };

    String jsonData = json.encode(booking.editStatusToJson());

    http.Response response = await http.put(
      url,
      headers: headers,
      body: jsonData,
    );
    print(booking.status);

    if (response.statusCode == 200) {
      // Successful update
      print('Employee updated successfully'); 
    } else {
      // Error handling
      print('Failed to update employee: ${response.body.replaceAll("\n", "")}');
      
    }
  } catch (e) {
    // Exception handling
    print('Failed to update data: $e');
    throw Exception('Failed to update data: $e');
  }
  // try {
  //     var url = '${ApiProvider.updateBookingStatus}$id/';
  //   String jsonData = json.encode(booking);

  //     await getConnect.put(url, jsonData);
      
  //   } catch (e) {
  //     throw Exception('Failed to update data');
  //   }
  }

  static delete(int id) async {
    final url = '${ApiProvider.deleteBookingStatus}$id/'; // Replace with your API endpoint

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
 


static Future<List<ReservationResponse>> sendSearchQuery(String query) async {
  // Replace 'your_backend_url' with your actual backend endpoint
  String backendUrl = '${ApiProvider.searchBooking}';

  try {
    // Send the search query to your backend and await the response
    http.Response response = await http.post(Uri.parse(backendUrl), body: {'query': query});
    
    // Check if the response status code is OK (200)
    if (response.statusCode == 200) {
      // Parse the response JSON into a list of ReservationResponse objects
      List<dynamic> jsonData = json.decode(response.body);
      List<ReservationResponse> reservations = jsonData.map((data) => ReservationResponse.fromJson(data)).toList();
      
      // Return the list of ReservationResponse objects
      return reservations;
    } else {
      // If the response status code is not OK, throw an exception with the response status code
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (error) {
    // If an error occurs during the request, throw an exception with the error message
    throw Exception('Error sending search query: $error');
  }
}

}
