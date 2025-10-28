import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/appcolors.dart';

class InvestmentCard extends StatelessWidget {
  final String iconAsset;
  final String name;
  final String exchange;
  final String changeText;
  final bool isPositiveChange;
  final String price;
  final String currency;
  final String? chartAsset;

  const InvestmentCard({
    super.key,
    required this.iconAsset,
    required this.name,
    required this.exchange,
    required this.changeText,
    required this.isPositiveChange,
    required this.price,
    required this.currency,
    this.chartAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.bgBaseDefault,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // График на фоне
          if (chartAsset != null)
            Positioned(
              bottom: 0,
              left: 0,
              width: 220,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SvgPicture.asset(
                  chartAsset!,
                  width: 220,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          // Контент карточки
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header карточки
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 4),
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
                    const SizedBox(width: 8),
                    // Название и биржа
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textBaseDefault,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            exchange,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textBaseSecondary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Body карточки
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Изменение цены
                      Row(
                        children: [
                          Text(
                            changeText,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: isPositiveChange
                                  ? AppColors.textPositiveDefault
                                  : AppColors.textNegativeDefault,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Цена и валюта
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            price,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textBaseDefault,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              currency,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textBaseSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

