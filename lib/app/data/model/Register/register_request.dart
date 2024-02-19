class RegisterRequest {
  final String? name;
  final String? address;
  final String? phoneNumber;
  final String? email;
  final String username;
  final String password;

  RegisterRequest({
     this.name,
     this.address,
     this.phoneNumber,
     this.email,
    required this.username,
   required  this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'email': email,
      'username': username,
      'password': password,
    };
  }

    factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      name: json['name'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      username: json['username'],
      password: json['password']
    );
  }
}
