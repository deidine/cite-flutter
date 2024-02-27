import 'package:cite3/app/data/model/user/user_request.dart';
import 'package:cite3/app/data/model/user/user_response.dart';
import 'package:cite3/app/data/repository/user_repository.dart';

abstract class UserService {
static Future<UserResponse> getUser(String username) async {
  try {
    return await UserRepository.getUser(username);
  } catch (e) {
    // Handle the error properly
    print('Failed to get user: $e');
    throw Exception('Failed to get user: $e');
  }
}
static Future<UserResponse> getUserById(int id) async {
  try {
    return await UserRepository.getUserById(id);
  } catch (e) {
    // Handle the error properly
    print('Failed to get user: $e');
    throw Exception('Failed to get user: $e');
  }
}

static updateUser(UserRequest request) async {
  try {
     await UserRepository.updateUser(request,request.idUser);
  } catch (e) {
    // Handle the error properly
    print('Failed to update user: $e'); 
  }
}

}
