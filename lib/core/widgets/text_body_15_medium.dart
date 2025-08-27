import 'package:flutter/material.dart';

class TextBody15Medium extends StatelessWidget {
  final String text;
  final Color color;

  const TextBody15Medium({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}
