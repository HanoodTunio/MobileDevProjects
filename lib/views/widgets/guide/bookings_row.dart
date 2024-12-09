// lib/views/widgets/bookings_row.dart

import 'package:flutter/material.dart';

class BookingsRow extends StatelessWidget {
  final String bookings;

  const BookingsRow({super.key, required this.bookings});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Bookings',
          style: TextStyle(
            color: Color(0xFF1A76D2),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          bookings,
          style: const TextStyle(
            color: Color(0xFF1A76D2),
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
