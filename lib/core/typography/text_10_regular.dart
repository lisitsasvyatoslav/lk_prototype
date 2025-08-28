import 'package:flutter/material.dart';

class Text10Regular extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final double? height;
  final int? maxLines;
  final TextOverflow? overflow;

  const Text10Regular({
    super.key,
    required this.text,
    this.color = const Color(0xFF9AA0AA),
    this.textAlign,
    this.height,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 10,
        color: color,
        fontWeight: FontWeight.w400,
        height: height,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
