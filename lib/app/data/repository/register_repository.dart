import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:cite3/app/data/model/Register/register_response.dart';
import 'package:cite3/app/data/model/Register/register_request.dart';
import 'package:cite3/app/data/provider/api_provider.dart';

abstract class RegisterRepository {
  static final getConnect = GetConnect();

  static Future<int> register(RegisterRequest user) async {
      try {
      var stream = http.ByteStream(DelegatingStream.typed(user.image!.openRead()));
      var length = await user.image!.length();

      var uri = Uri.parse(ApiProvider.register);
      var request = http.MultipartRequest("POST", uri);
      var multipartFile = http.MultipartFile(
        'image',//the same shuld be in backend serliser
        stream,
        length,
        filename: basename(user.image!.path),
        // contentType: MediaType('image', 'jpeg'), // Adjust content type as necessary
      );

      //this for others 
      request.fields.addAll(user.toJson());
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
}
