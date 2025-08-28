import 'package:flutter/material.dart';
import '../../../core/typography/text_16_semibold.dart';

class SectionLabel extends StatelessWidget {
  final String text;
  const SectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text16Semibold(text: text),
    );
  }
}


