import 'package:flutter/material.dart';

class Text12Regular extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;

  const Text12Regular({
    super.key,
    required this.text,
    this.color = const Color(0xFF9AA0AA),
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        color: color,
        fontWeight: FontWeight.w400,
      ),
      textAlign: textAlign,
    );
  }
}
