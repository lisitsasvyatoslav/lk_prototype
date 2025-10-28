import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/appcolors.dart';

class StockItem extends StatelessWidget {
  final String iconAsset;
  final String name;
  final String subtitle;
  final String price;
  final String changeText;
  final bool isPositiveChange;

  const StockItem({
    super.key,
    required this.iconAsset,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.changeText,
    this.isPositiveChange = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: AppColors.borderBaseDefault,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Логотип 32x32
          SizedBox(
            width: 32,
            height: 32,
            child: SvgPicture.asset(
              iconAsset,
              width: 32,
              height: 32,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 12),
          // Текстовая информация
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textBaseDefault,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textBaseSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Цена и изменение
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBaseDefault,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                changeText,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: isPositiveChange
                      ? AppColors.textPositiveDefault
                      : AppColors.textNegativeDefault,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}