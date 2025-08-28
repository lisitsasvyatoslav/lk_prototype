import 'package:flutter/material.dart';
import '../../../core/typography/text_10_regular.dart';
import '../../../core/typography/text_12_regular.dart';
import '../../../core/typography/text_12_medium.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text12Regular(
              text: 'Статус',
              color: Color(0xFF9AA0AA),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                   Text12Medium(
                     text: 'КПУР',
                   ),
                  SizedBox(height: 4),
                  Text10Regular(
                     text: 'Клиент с повышенным\nуровнем риска',
                     textAlign: TextAlign.right,
                     color: Color(0xFF9AA0AA),
                     height: 1.2,
                   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


