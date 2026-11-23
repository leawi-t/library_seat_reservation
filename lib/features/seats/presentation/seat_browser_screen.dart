import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SeatBrowserScreen extends StatelessWidget {
  const SeatBrowserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Library Seats')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Seat Browser (Screen 1)'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/seats/seat-101'),
              child: const Text('View Dummy Seat Detail'),
            ),
          ],
        ),
      ),
    );
  }
}
