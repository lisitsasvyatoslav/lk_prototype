import 'package:flutter/material.dart';

class TableHeadText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const TableHeadText({
    super.key,
    required this.text,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 11,
        color: Color(0xFF9AA0AA),
        fontWeight: FontWeight.w400,
      ),
      textAlign: textAlign,
    );
  }
}
