import 'package:flutter/material.dart';
import 'category_chip.dart';

class CategoryChipsRow extends StatelessWidget {
  final List<Widget> chips;

  const CategoryChipsRow({
    super.key,
    required this.chips,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          for (int i = 0; i < chips.length; i++) ...[
            chips[i],
            if (i < chips.length - 1) const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }
}