import 'package:flutter/material.dart';
import '../../../core/theme/appcolors.dart';

class TipCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  final Color titleColor;
  final Color subtitleColor;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const TipCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.titleColor = AppColors.textBaseDefault,
    this.subtitleColor = AppColors.textBaseSecondary,
    this.backgroundColor = AppColors.bgBaseDefault,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget cardContent = Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12, 
              color: subtitleColor,
            ),
          ),
        ],
      ),
    );

    if (onTap != null) {
      return Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: cardContent,
        ),
      );
    }

    return Expanded(child: cardContent);
  }
}
