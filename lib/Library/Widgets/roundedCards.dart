import 'package:flutter/material.dart';

class RoundedCards extends StatelessWidget {
  const RoundedCards({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
