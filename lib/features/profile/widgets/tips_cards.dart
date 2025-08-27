import 'package:flutter/material.dart';
import 'tip_card.dart';

class TipsCards extends StatelessWidget {
  const TipsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TipCard(
          icon: Icons.flash_on,
          title: "Не определен",
          subtitle: "Инвестиционный\nпрофиль",
        ),
        const SizedBox(width: 12),
        TipCard(
          icon: Icons.emoji_events,
          title: "Получить статус",
          subtitle: "Квалифицированный\nинвестор",
        ),
      ],
    );
  }
}
