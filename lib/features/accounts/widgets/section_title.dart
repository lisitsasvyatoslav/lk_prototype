import 'package:flutter/material.dart';
import '../../../core/theme/appcolors.dart';
import '../../../core/typography/text_14_semibold.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text14Semibold(text, color: AppColors.textBaseSecondary),
      ),
    );
  }
}


