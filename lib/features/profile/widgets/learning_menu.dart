import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/theme/appcolors.dart';

class LearningMenuCard extends StatelessWidget {
  const LearningMenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    const divider = Divider(height: 1, thickness: 1, color: AppColors.borderBaseDefault);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgBaseDefault,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _MenuRow(
            leading: Icon(
              CupertinoIcons.gift_fill,
              color: AppColors.iconBrandDefault,
              size: 24,
            ),
            title: 'Тестирования для инвесторов',
            subtitle: '2 из 4 тестов пройдено',
          ),
          divider,
          _MenuRow(
            leading: Icon(
              CupertinoIcons.doc,
              color: AppColors.iconBrandDefault,
              size: 24,
            ),
            title: 'Центр обучения',
          ),
        ],
      ),
    );
  }
}

class _MenuRow extends StatelessWidget {
  final Widget leading;
  final String title;
  final String? subtitle;

  const _MenuRow({
    required this.leading,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    const double rowHeight = 64;
    return SizedBox(
      height: rowHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 16),
          leading,
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textBaseDefault,
                  ),
                ),
                if (subtitle != null) ...[
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.textBaseTertiary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: AppColors.iconBaseSecondary),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}


