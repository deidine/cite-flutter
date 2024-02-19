import 'package:cite3/app/data/model/Register/register_request.dart';
import 'package:cite3/app/data/repository/register_repository.dart';

abstract class RegisterService {
  static Future<bool> register(RegisterRequest request) async {
    try {
      final result = await RegisterRepository.register(request);
      if (result == 201) return true;

      return false;
    } catch (e) {
      throw Exception(e);
    }
  }
}
