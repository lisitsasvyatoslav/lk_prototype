import 'package:flutter/material.dart';
import '../theme/appcolors.dart';

class Text12Medium extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;

  const Text12Medium({
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
        fontSize: 12,
        color: color,
        fontWeight: FontWeight.w500,
      ),
      textAlign: textAlign,
    );
  }
}
