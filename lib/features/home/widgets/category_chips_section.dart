import 'package:flutter/material.dart';
import 'category_chip.dart';
import 'category_chips_row.dart';

class CategoryChipsSection extends StatelessWidget {
  const CategoryChipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CategoryChipsRow(
          chips: const [
            CategoryChip(
              text: '',
              iconAsset: '../../../../assets/icons/main_screen/star-solid.svg',
            ),
            CategoryChip(text: 'Акции'),
            CategoryChip(text: 'Фонды'),
            CategoryChip(text: 'Облигации'),
            CategoryChip(text: 'Акции'),
            CategoryChip(text: 'Акции'),
          ],
        ),
        const SizedBox(height: 16),
        CategoryChipsRow(
          chips: const [
            CategoryChip(text: 'Опционы'),
            CategoryChip(text: 'Свопы'),
            CategoryChip(text: 'Спреды'),
            CategoryChip(text: 'Индексы'),
            CategoryChip(text: 'Опционы'),
            CategoryChip(text: 'Опционы'),
          ],
        ),
      ],
    );
  }
}

