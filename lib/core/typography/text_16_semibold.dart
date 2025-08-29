import 'package:flutter/material.dart';
import '../theme/appcolors.dart';

class Text16Semibold extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;

  const Text16Semibold({
    super.key,
    required this.text,
    this.color = AppColors.textBaseDefault,
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
