import 'package:get/get.dart';
import 'package:cite3/app/data/model/Register/register_response.dart';
import 'package:cite3/app/data/model/Register/register_request.dart';
import 'package:cite3/app/data/provider/api_provider.dart';

abstract class RegisterRepository {
  static final getConnect = GetConnect();

  static Future<int> register(RegisterRequest request) async {
    Response<dynamic> req;

    try {
      req = await getConnect.post(ApiProvider.register, request.toJson());
      print(req.statusCode );
      print(req );
       if (req.statusCode == 201) {
        // Successfully created
        // print('Employee created successfully');
        return 201;
      } else {
        // Failed to create
        print('Failed to create employee');
    return 400;

      }
      // return RegisterResponse.fromJson(req.body);
    } catch (e) {
      throw Exception('Failed to send request');
    }
  }
}
