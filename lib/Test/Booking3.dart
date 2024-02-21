import "package:flutter/material.dart";
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookingSlot {
  final int id;
  final DateTime slotDateTime;
  final bool isBooked;

  BookingSlot({required this.id, required this.slotDateTime, required this.isBooked});

  factory BookingSlot.fromJson(Map<String, dynamic> json) {
    return BookingSlot(
      id: json['id'],
      slotDateTime: DateTime.parse(json['slot_datetime']),
      isBooked: json['is_booked'],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking App',
      home: BookingPage(),
    );
  }
}

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List<BookingSlot> bookingSlots = [];

  @override
  void initState() {
    super.initState();
    fetchBookingSlots();
  }

  Future<void> fetchBookingSlots() async {
    final response = await http.get(Uri.parse('http://your-django-api-url/api/bookingslots/'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      setState(() {
        bookingSlots = jsonData.map((e) => BookingSlot.fromJson(e)).toList();
      });
    } else {
      throw Exception('Failed to load booking slots');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking App'),
      ),
      body: ListView.builder(
        itemCount: bookingSlots.length,
        itemBuilder: (context, index) {
          final slot = bookingSlots[index];
          return ListTile(
            title: Text('Slot ${slot.id}'),
            subtitle: Text('Date: ${slot.slotDateTime}, Booked: ${slot.isBooked ? 'Yes' : 'No'}'),
          );
        },
      ),
    );
  }
}





// from django.db import models
// from django.utils import timezone

// class BookingSlot(models.Model):
//     slot_datetime = models.DateTimeField()
//     is_booked = models.BooleanField(default=False)

//     def __str__(self):
//         return f"Slot at {self.slot_datetime}"

//     def is_available(self):
//         return not self.is_booked

//     def book_slot(self):
//         if self.is_available():
//             self.is_booked = True
//             self.save()
//             return True
//         return False

//     def cancel_booking(self):
//         if not self.is_available():
//             self.is_booked = False
//             self.save()
//             return True
//         return False
// # serializers.py
// from rest_framework import serializers
// from .models import BookingSlot

// class BookingSlotSerializer(serializers.ModelSerializer):
//     class Meta:
//         model = BookingSlot
//         fields = ['id', 'slot_datetime', 'is_booked']


// # views.py
// from rest_framework import generics
// from .models import BookingSlot
// from .serializers import BookingSlotSerializer

// class BookingSlotListCreateView(generics.ListCreateAPIView):
//     queryset = BookingSlot.objects.all()
//     serializer_class = BookingSlotSerializer

// class BookingSlotRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
//     queryset = BookingSlot.objects.all()
//     serializer_class = BookingSlotSerializer


// # urls.py
// from django.urls import path
// from .views import BookingSlotListCreateView, BookingSlotRetrieveUpdateDestroyView

// urlpatterns = [
//     path('api/bookingslots/', BookingSlotListCreateView.as_view(), name='bookingslot-list-create'),
//     path('api/bookingslots/<int:pk>/', BookingSlotRetrieveUpdateDestroyView.as_view(), name='bookingslot-detail'),
// ]
