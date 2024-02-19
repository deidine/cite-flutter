import 'package:cite3/app/data/model/Register/register_request.dart';
import 'package:cite3/app/data/model/login/login_request.dart';
import 'package:cite3/app/data/repository/login_repository.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:cite3/app/data/provider/api_provider.dart';

abstract class LoginService {
  // static Future<bool> login(RegisterRequest request) async {
  //   try {
  //     final result = await LoginRepository.login(request);
  //     if (result != null) return true;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  //   return false;
  // }

// static Future<String?> fetchCSRFToken() async {
//   final response = await http.get(Uri.parse(ApiProvider.base));
//   if (response.statusCode == 200) {
//     return response.body;
//   } else {
//     throw Exception('Failed to fetch CSRF token');
//   }
// }


static Future<bool> login(String username, String password ) async {
  final url = Uri.parse( ApiProvider.login);
  final response = await http.post(
    url,
    body: json.encode({'username': username, 'password': password}),
    headers: {'Content-Type': 'application/json',    
      // 'X-CSRFToken': csrfToken,
   }

  );

  if (response.statusCode == 200) {
    // Login successful
    print('Login successful');
    return true;
  } else {
    // Login failed
    print('Login failed: ${response.body}');
    return false;
  
  }
}
}
