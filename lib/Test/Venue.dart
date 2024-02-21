import 'package:flutter/material.dart';


class Venue {
  final String name;
  final String address;
  final int capacity;
  final String description;

  Venue({
    required this.name,
    required this.address,
    required this.capacity,
    required this.description,
  });
}

class MyAppVenu extends StatelessWidget {
  final List<Venue> venues = [
    Venue(
      name: 'Venue A',
      address: '123 Main St',
      capacity: 100,
      description: 'A spacious venue with modern amenities.',
    ),
    Venue(
      name: 'Venue B',
      address: '456 Elm St',
      capacity: 50,
      description: 'An intimate venue perfect for small gatherings.',
    ),
    // Add more venues as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Venue Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VenueListScreen(venues: venues),
    );
  }
}

class VenueListScreen extends StatelessWidget {
  final List<Venue> venues;

  const VenueListScreen({Key? key, required this.venues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Venues'),
      ),
      body: ListView.builder(
        itemCount: venues.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(venues[index].name),
            subtitle: Text(venues[index].address),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VenueDetailsScreen(venue: venues[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class VenueDetailsScreen extends StatelessWidget {
  final Venue venue;

  const VenueDetailsScreen({Key? key, required this.venue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(venue.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Address: ${venue.address}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Capacity: ${venue.capacity}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Description: ${venue.description}',
              style: TextStyle(fontSize: 18),
            ),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
