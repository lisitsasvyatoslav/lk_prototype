import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/typography/text_15_semibold.dart';
import '../../../core/typography/text_15_regular.dart';
import '../../../core/typography/text_11_regular.dart';
import '../../../core/typography/text_10_regular.dart';
import '../../../core/typography/text_12_regular.dart';
import '../../../core/typography/text_12_medium.dart';
import '../../../core/theme/appcolors.dart';

enum TariffType { premium, portfolio }

class AccountListItem extends StatelessWidget {
  final String balance;
  final String changeText;
  final Color changeColor;
  final String number;
  final String subtitle;
  final String? secondaryLine;
  final String? badge;
  final bool isFavorite;
  final TariffType? tariffType;
  final String? tariffTitle;
  final String? tariffSubtitle;
  final void Function(BuildContext context)? onTap;
  final void Function(BuildContext context)? onTariffTap;

  const AccountListItem({
    super.key,
    required this.balance,
    required this.changeText,
    required this.changeColor,
    required this.number,
    required this.subtitle,
    this.secondaryLine,
    this.badge,
    this.isFavorite = false,
    this.tariffType,
    this.tariffTitle,
    this.tariffSubtitle,
    this.onTap,
    this.onTariffTap,
  });

  Widget _buildTariffIcon() {
    switch (tariffType) {
      case TariffType.premium:
        return Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF9F9F9), Color(0xFFDFE4ED)],
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/chart_forest.svg',
              width: 20.5,
              height: 20.5,
            ),
          ),
        );
      case TariffType.portfolio:
        return Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF9F9F9), Color(0xFFDFE4ED)],
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/chart_forest.svg',
              width: 20.5,
              height: 20.5,
            ),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgBaseDefault,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // Основной контент
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Верхняя секция с балансом и изменением
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Основная сумма и изменение в одной строке
                          Row(
                            children: [
                              Text15Semibold(
                                text: balance,
                                color: AppColors.textBaseDefault,
                              ),
                              const SizedBox(width: 8),
                              Text15Regular(
                                text: changeText,
                                color: changeColor,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          // Номер счета и подзаголовок
                          Row(
                            children: [
                              Text11Regular(
                                text: number,
                                color: AppColors.textBaseSecondary,
                              ),
                              const SizedBox(width: 4),
                              Text11Regular(
                                text: '•',
                                color: AppColors.textBaseSecondary,
                              ),
                              const SizedBox(width: 4),
                              Text11Regular(
                                text: subtitle,
                                color: AppColors.textBaseSecondary,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Звездочка справа, отцентрированная по вертикали
                    if (isFavorite)
                      const Icon(
                        CupertinoIcons.star_fill,
                        color: AppColors.iconBaseTertiary,
                        size: 20,
                      ),
                  ],
                ),
                
                // Разделитель
                if (tariffType != null) ...[
                  const SizedBox(height: 12),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: AppColors.borderBaseDefault,
                  ),
                  const SizedBox(height: 12),
                  
                  // Тариф секция
                  Row(
                    children: [
                      // Иконка тарифа
                      _buildTariffIcon(),
                      const SizedBox(width: 8),
                      // Текст тарифа
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text12Medium(
                              text: tariffTitle ?? '',
                              color: AppColors.textBaseDefault,
                            ),
                            Text10Regular(
                              text: tariffSubtitle ?? 'Текущий тариф',
                              color: AppColors.textBaseSecondary,
                            ),
                          ],
                        ),
                      ),
                      // Стрелка справа
                      const Icon(
                        CupertinoIcons.chevron_right,
                        color: AppColors.iconBaseTertiary,
                        size: 8,
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          
          // Верхняя половина - для навигации к деталям счета
          if (onTap != null)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: tariffType != null ? null : null, // Если есть тариф, то половина высоты
              child: tariffType != null 
                ? SizedBox(
                    height: 60, // Примерная высота верхней части
                    child: GestureDetector(
                      onTap: () => onTap!(context),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () => onTap!(context),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
            ),
          
          // Нижняя половина - для навигации к тарифам
          if (tariffType != null && onTariffTap != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 60, // Примерная высота нижней части
              child: GestureDetector(
                onTap: () => onTariffTap!(context),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
