import 'package:flutter/material.dart';

class PasswordRequirement extends StatelessWidget {
  const PasswordRequirement({
    super.key,
    required this.text,
    required this.isValid,
  });

  final String text;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 5,
      children: [
        Icon(Icons.check_circle, color: isValid ? Colors.green : Colors.black),
        Text(
          text,
          style: TextStyle(
            color: isValid ? Colors.green : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
