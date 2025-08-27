import 'package:flutter/material.dart';

class Text11Regular extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;

  const Text11Regular({
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
        fontSize: 11,
        color: color,
        fontWeight: FontWeight.w400,
      ),
      textAlign: textAlign,
    );
  }
}
