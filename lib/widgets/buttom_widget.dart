import 'package:flutter/material.dart';

class ButtomWidget extends StatelessWidget {
  final String label;
  final double value;
  final VoidCallback onPressFunction;
  final ButtonColor color;

  const ButtomWidget(
      {required this.label,
      required this.value,
      required this.onPressFunction,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        primary: color.name == 'normal' ? Colors.grey[400] : Colors.black,
      ),
      onPressed: onPressFunction,
      child: Text(
        label,
        style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: color.name == 'normal' ? Colors.black : Colors.white),
      ),
    );
  }
}

enum ButtonColor { normal, function }
