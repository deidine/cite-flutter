class UserResponse {
  int idUser;
  String name,username;
  String address;
  String phoneNumber;
  String email;
  String image;
String? role,status;
  UserResponse({
    required this.idUser,
    required this.name,
    required this.username,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.image,
    this.role,
    this.status
  });
 
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      idUser: json['id'],
      role: json['role'],
      name: json['name'],
      username: json['username'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      // image: json['image'],
      image: json['image'].replaceAll('\n', ''),
    );
  }
}
