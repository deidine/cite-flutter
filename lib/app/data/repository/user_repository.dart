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

  static Future<UserResponse> updateUser(UserRequest request) async {
    try {
      var url = ApiProvider.updateUser;
      final req = await getConnect.put(url, request.toJson());
      return UserResponse.fromJson(req.body['data']);
    } catch (e) {
      throw Exception('Failed to update data');
    }
  }
}
