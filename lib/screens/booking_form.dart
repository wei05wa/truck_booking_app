import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class BookingFormScreen extends StatefulWidget {
  @override
  _BookingFormScreenState createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> {
  final _pickupController = TextEditingController();
  final _dropController = TextEditingController();
  final _goodsController = TextEditingController();

  void _submitBooking() async {
    final bookingId = Uuid().v4();
    await FirebaseFirestore.instance.collection('bookings').doc(bookingId).set({
      'pickup': _pickupController.text,
      'drop': _dropController.text,
      'goods': _goodsController.text,
      'status': 'Pending',
      'created_at': Timestamp.now(),
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book a Truck")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _pickupController,
              decoration: InputDecoration(labelText: "Pickup Location"),
            ),
            TextField(
              controller: _dropController,
              decoration: InputDecoration(labelText: "Drop Location"),
            ),
            TextField(
              controller: _goodsController,
              decoration: InputDecoration(labelText: "Type of Goods"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitBooking,
              child: Text("Submit Booking"),
            ),
          ],
        ),
      ),
    );
  }
}
