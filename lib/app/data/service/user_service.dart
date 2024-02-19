import 'package:cite3/app/data/model/user/user_request.dart';
import 'package:cite3/app/data/model/user/user_response.dart';
import 'package:cite3/app/data/repository/user_repository.dart';

abstract class UserService {
  static Future<UserResponse> getUser(String username) async {
    
    try {
      return await UserRepository.getUser(username);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<UserResponse> updateUser(UserRequest request) async {
    try {
      return await UserRepository.updateUser(request);
    } catch (e) {
      throw Exception(e);
    }
  }
}
