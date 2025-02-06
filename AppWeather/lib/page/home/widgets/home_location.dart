import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat; // ✅ IMPORT intl

class HomeLocation extends StatelessWidget {
  final String name; // Use 'final' for immutable fields
  HomeLocation({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/icons/location.png'),
            const SizedBox(width: 10),
            Text(
              '$name' + ' City', // Remove 'const' here
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10), // Add 'const' here
        Text(
          DateFormat.yMMMd().format(DateTime.now()), // Only pass 'DateTime'
          style: const TextStyle( // 'style' should be outside 'format()'
            fontSize: 28,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
