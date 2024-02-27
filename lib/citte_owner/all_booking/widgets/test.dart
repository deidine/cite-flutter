// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;


// class VenueBookingWidget extends StatefulWidget {
//   @override
//   _VenueBookingWidgetState createState() => _VenueBookingWidgetState();
// }

// class _VenueBookingWidgetState extends State<VenueBookingWidget> {
//   late Future<List<User>> usersFuture;
//   late List<User> users = [];

//   @override
//   void initState() {
//     super.initState();
//     usersFuture = fetchUsers();
//   }

//   Future<List<User>> fetchUsers() async {
//     final response = await http.get(Uri.parse('YOUR_USERS_API_URL'));
//     if (response.statusCode == 200) {
//       final List<dynamic> responseData = jsonDecode(response.body);
//       List<User> fetchedUsers = responseData.map((json) => User.fromJson(json)).toList();
//       return fetchedUsers;
//     } else {
//       throw Exception('Failed to load users');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Booking Information'),
//       ),
//       body: FutureBuilder<List<User>>(
//         future: usersFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             users = snapshot.data!;
//             return ListView.builder(
//               itemCount: users.length,
//               itemBuilder: (context, index) {
//                 return UserBookingListItem(user: users[index]);
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class UserBookingListItem extends StatefulWidget {
//   final User user;

//   UserBookingListItem({required this.user});

//   @override
//   _UserBookingListItemState createState() => _UserBookingListItemState();
// }

// class _UserBookingListItemState extends State<UserBookingListItem> {
//   late Future<List<Booking>> bookingsFuture;
//   late List<Booking> userBookings = [];

//   @override
//   void initState() {
//     super.initState();
//     bookingsFuture = fetchBookings(widget.user.id);
//   }

//   Future<List<Booking>> fetchBookings(int userId) async {
//     final response = await http.get(Uri.parse('YOUR_BOOKINGS_API_URL?userId=$userId'));
//     if (response.statusCode == 200) {
//       final List<dynamic> responseData = jsonDecode(response.body);
//       List<Booking> fetchedBookings = responseData.map((json) => Booking.fromJson(json)).toList();
//       return fetchedBookings;
//     } else {
//       throw Exception('Failed to load bookings');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Booking>>(
//       future: bookingsFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return ListTile(
//             title: Text('User: ${widget.user.name}'),
//             subtitle: CircularProgressIndicator(),
//           );
//         } else if (snapshot.hasError) {
//           return ListTile(
//             title: Text('User: ${widget.user.name}'),
//             subtitle: Text('Error: ${snapshot.error}'),
//           );
//         } else {
//           userBookings = snapshot.data!;
//           return ExpansionTile(
//             title: Text('User: ${widget.user.name}'),
//             children: [
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: ClampingScrollPhysics(),
//                 itemCount: userBookings.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text('Booking Time: ${userBookings[index].bookingTime}'),
//                     subtitle: Text('Venue ID: ${userBookings[index].venueId}'),
//                   );
//                 },
//               ),
//             ],
//           );
//         }
//       },
//     );
//   }
// }
