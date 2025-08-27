import 'package:flutter/material.dart';

class Text15Regular extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;

  const Text15Regular({
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
        fontSize: 15,
        color: color,
        fontWeight: FontWeight.w400,
      ),
      textAlign: textAlign,
    );
  }
}
