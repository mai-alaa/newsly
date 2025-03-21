// header.dart
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;


  const CustomAppBar({
    super.key,
    required this.title,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Icon(Icons.newspaper),
        ],
      ),
    );
  }
}