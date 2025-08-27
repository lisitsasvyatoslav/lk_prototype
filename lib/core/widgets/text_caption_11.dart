import 'package:flutter/material.dart';

class TextCaption11 extends StatelessWidget {
  final String text;
  final Color? color;

  const TextCaption11({
    super.key,
    required this.text,
    this.color = const Color(0xFF8E8E93),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}
