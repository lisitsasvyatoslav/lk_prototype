import 'package:flutter/material.dart';

class Text16Semibold extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;

  const Text16Semibold({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: color,
        fontWeight: FontWeight.w600,
      ),
      textAlign: textAlign,
    );
  }
}
