import 'dart:io';

class RegisterRequest {
  final String? name;
  final String? address;
  final String? phoneNumber;
  final String? email;
  final String username;
  final String password;
  final String role,status;
  final File   image;
  RegisterRequest( {
  required  this.name,
  required  this.address,
  required  this.phoneNumber,
    required this.email,
    required this.username,
    required this.password,
    required this.role,
    required this.status,
     required this.image,
  });

  Map<String, String> toJson() {
    return {
      'name': name!,
      'address': address!,
      'phoneNumber': phoneNumber!,
      'email': email!,
      'role': role,
      'username': username,
      'password': password,
      'status':status
    };
  }

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
        name: json['name'],
        role: json['role'],
        address: json['address'],
        phoneNumber: json['phoneNumber'],
        email: json['email'],
        username: json['username'],
        password: json['password'],
        status: json['status'],
        image: json['image']);
  }
}
