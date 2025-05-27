import 'package:flutter/material.dart';
import 'booking_form.dart';
import 'my_bookings.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Book a Truck"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => BookingFormScreen()),
                );
              },
            ),
            ElevatedButton(
              child: Text("My Bookings"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => MyBookingsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
