import 'dart:io';

class RegisterRequest {
  final String? name;
  final String? address;
  final String? phoneNumber;
  final String? email;
  final String username;
  final String password;
  final String role;
  final File? image;
  RegisterRequest({
    this.name,
    this.address,
    this.phoneNumber,
    this.email,
    required this.username,
    required this.password,
    required this.role,
      this.image,
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
        password: json['password']);
  }
}
