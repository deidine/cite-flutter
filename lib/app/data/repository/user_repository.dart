import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:cite3/app/data/model/user/user_request.dart';

import '../model/user/user_response.dart';
import '../provider/api_provider.dart';

abstract class UserRepository {
  static final getConnect = GetConnect();

  static Future<UserResponse> getUser(String username) async {
    Response<dynamic> req;
       try {
       var url = Uri.parse('${ApiProvider.getDetailUser}$username/');

      final response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
 
      var extractedData = json.decode(response.body);

     return    UserResponse.fromJson(extractedData);
      
  } catch (e) {
      throw Exception('Failed to fetch data');
    }
      // return UserResponse.fromJson(jsonDecode(data));
    
    // final List<VenueResponse> data =response.body['data'];
  }
    static Future<UserResponse> getUserById(int id) async {
    Response<dynamic> req;
       try {
       var url = Uri.parse('${ApiProvider.getDetailUserById}$id/');

      final response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
 
      var extractedData = json.decode(response.body);

     return    UserResponse.fromJson(extractedData);
      
  } catch (e) {
      throw Exception('Failed to fetch data');
    }
      // return UserResponse.fromJson(jsonDecode(data));
    
    // final List<VenueResponse> data =response.body['data'];
  }
  static   updateUser(UserRequest request,int id) async {
    try {
      var url = '${ApiProvider.updateUser}$id/';
    String jsonData = json.encode(request);

      await getConnect.put(url, jsonData);
      
    } catch (e) {
      throw Exception('Failed to update data');
    }
  }


static Future<UserResponse> updateUser2(UserRequest request,int id) async {
  try {
    Uri url = Uri.parse('${ApiProvider.updateUser}$id/');
    // String csrfToken = await fetchCSRFToken();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      // 'X-CSRFToken': csrfToken,
    };

    String jsonData = json.encode(request);

    http.Response response = await http.put(
      url,
      headers: headers,
      body: jsonData,
    );

    if (response.statusCode == 200) {
      // Successful update
      print('Employee updated successfully');
      return getUser(request.name);
    } else {
      // Error handling
      print('Failed to update employee: ${response.body.replaceAll("\n", "")}');
      return getUser(request.name);
    }
  } catch (e) {
    // Exception handling
    print('Failed to update data: $e');
    throw Exception('Failed to update data: $e');
  }
}

  static Future<String> fetchCSRFToken() async {
    Uri url = Uri.parse('${ApiProvider.getCsrf}');

    // Make a GET request to obtain the CSRF token
    http.Response response = await http.get(url as Uri);

    // Extract the CSRF token from the response headers
    String csrfToken =
        response.headers['Set-Cookie']!.split('; ')[0].split('=')[1];

    return csrfToken;
  }
}
