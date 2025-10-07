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
import '../../tariff/screens/premium_tariff_screen.dart';
import '../../tariff/screens/tariffs_sheet_a.dart';
import 'tariff_section.dart';

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
  final bool showIISIcon;
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
    this.showIISIcon = false,
    this.onTap,
    this.onTariffTap,
  });


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
                              // Иконка ИИС после названия счета
                              if (showIISIcon) ...[
                                const SizedBox(width: 4),
                                SvgPicture.asset(
                                  'assets/icons/individual-invest.account.colored.24.svg',
                                  width: 20,
                                  height: 20,
                                ),
                              ],
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
                
                // Секция тарифа
                TariffSection(
                  tariffType: tariffType,
                  tariffTitle: tariffTitle,
                  tariffSubtitle: tariffSubtitle,
                  onTariffTap: (context, selectedTariff) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TariffsScreen(
                          selectedTariff: tariffTitle, // Устанавливаем текущий тариф как активный
                          connectedTariff: tariffTitle, // И как подключенный
                        ),
                      ),
                    );
                  },
                ),
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
