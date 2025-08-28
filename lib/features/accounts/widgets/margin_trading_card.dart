import 'package:flutter/material.dart';
import '../../../core/typography/text_15_regular.dart';
import '../../../core/typography/text_15_semibold.dart';
import '../../../core/typography/text_11_regular.dart';

class MarginTradingCard extends StatelessWidget {
  const MarginTradingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Color(0x11000000), blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text15Regular(text: 'Маржинальная торговля'),
                Text15Semibold(text: 'Вкл.', color: const Color(0xFF34C759)),
              ],
            ),
            const SizedBox(height: 4),
            const Text11Regular(text: 'Отключить можно в чате поддержки'),
            const SizedBox(height: 12),
            Container(
              height: 40,
              decoration: BoxDecoration(color: const Color(0xFFF0F1F4), borderRadius: BorderRadius.circular(10)),
              alignment: Alignment.center,
              child: const Text15Semibold(text: 'Написать в чат', color: Color(0xFF303441)),
            ),
          ],
        ),
      ),
    );
  }
}


