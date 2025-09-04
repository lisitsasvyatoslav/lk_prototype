import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'tip_card.dart';
import '../../../core/theme/appcolors.dart';

class TipsCards extends StatelessWidget {
  const TipsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TipCard(
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.opacityBase24,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset('assets/icons/profile_icon_invest.svg', width: 28, height: 28),
            ),
          ),
          title: "Не определен",
          subtitle: "Инвестиционный\nпрофиль",
        ),
        const SizedBox(width: 12),
        TipCard(
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.opacityBase24,
                width: 3,
              ),
            ),
            child: Center(
              child: SvgPicture.asset('assets/icons/profile_icon_qual.svg', width: 28, height: 28),
            ),
          ),
          title: "Получить статус",
          subtitle: "Квалифицированный\nинвестор",
        ),
      ],
    );
  }
}
