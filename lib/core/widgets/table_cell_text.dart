import 'package:flutter/material.dart';

class TableCellText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const TableCellText({
    super.key,
    required this.text,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: Color(0xFF303441),
        fontWeight: FontWeight.w400,
      ),
      textAlign: textAlign,
    );
  }
}
