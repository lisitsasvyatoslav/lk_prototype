import 'package:flutter/material.dart';

class TextTitle15Semibold extends StatelessWidget {
  final String text;
  final Color? color;
  final bool overflow;

  const TextTitle15Semibold({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.overflow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      overflow: overflow ? TextOverflow.ellipsis : null,
    );
  }
}
