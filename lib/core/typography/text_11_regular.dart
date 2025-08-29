import 'package:flutter/material.dart';
import '../theme/appcolors.dart';

class Text11Regular extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;

  const Text11Regular({
    super.key,
    required this.text,
    this.color = AppColors.textBaseTertiary,
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
