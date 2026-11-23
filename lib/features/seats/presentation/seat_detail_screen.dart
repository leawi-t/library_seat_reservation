import 'package:flutter/material.dart';

class SeatDetailScreen extends StatelessWidget {
  const SeatDetailScreen({required this.seatId, super.key});

  final String seatId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seat $seatId')),
      body: Center(
        child: Text('Seat Detail & Booking for: $seatId'),
      ),
    );
  }
}
