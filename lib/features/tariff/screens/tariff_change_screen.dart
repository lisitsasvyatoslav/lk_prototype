import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/widgets/tariff_row.dart';
import '../../../core/widgets/screen_header.dart';
import 'sms_confirmation_screen.dart';
import '../../../core/theme/appcolors.dart';
// top to bottom, #F9F9F9 to #DFE4ED
class TariffChangeScreen extends StatelessWidget {
  final String currentTariff;
  final String newTariff;
  final String currentTariffCost;
  final String newTariffCost;
  final String currentTariffDate;
  final String newTariffDate;
  final String? selectedAccountId;
  final String? selectedAccountName;
  final String? newTariffIcon;
  final double? newTariffIconSize;
  final Color? newTariffIconBackgroundColor;

  const TariffChangeScreen({
    super.key,
    required this.currentTariff,
    required this.newTariff,
    required this.currentTariffCost,
    required this.newTariffCost,
    required this.currentTariffDate,
    required this.newTariffDate,
    this.selectedAccountId,
    this.selectedAccountName,
    this.newTariffIcon,
    this.newTariffIconSize,
    this.newTariffIconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBaseTertiary,
      body: Column(
        children: [
          SizedBox(height: 0),
          ScreenHeader(title: 'Смена тарифа'),
          
          // Информация о выбранном счете
          if (selectedAccountId != null && selectedAccountName != null)
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    'Вы меняете тариф на счете',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBaseSecondary,
                    ),
                  ),
                  Text(
                    selectedAccountName!,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBaseDefault,
                    ),
                  ),
                ],
              ),
            ),
          
          // Верхняя половина - тарифы
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Текущий тариф
                Container(
                    decoration: BoxDecoration(
                        color: AppColors.bgBaseDefault,
                        borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                        children: [
                        TariffRow(
                            title: 'Инвестор',
                            subtitle: 'Бесплатно • с 23 дек 2023',
                            svgIcon: 'assets/icons/chart_forest.svg',
                            iconSize: 20.5,
                            gradient: const [Color(0xFFF9F9F9), Color(0xFFDFE4ED)],
                        ),
                        ],
                    ),
                ),
                  
                  const SizedBox(height: 8),
                  
                  // Стрелка вниз
                  Container(
                    width: 24,
                    height: 24,
                    child: Icon(
                      CupertinoIcons.arrow_down,
                      color: AppColors.opacityBase72,
                      size: 16,
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Новый тариф
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.bgBaseDefault,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TariffRow(
                      title: newTariff,
                      subtitle: '$newTariffCost • $newTariffDate',
                      svgIcon: newTariffIcon ?? 'assets/icons/wallet_transfer_send.svg',
                      iconSize: 22.8,
                      gradient: newTariffIconBackgroundColor != null 
                        ? [newTariffIconBackgroundColor!.withOpacity(0.1), newTariffIconBackgroundColor!.withOpacity(0.2)]
                        : const [Color(0xFFF9F9F9), Color(0xFFDFE4ED)],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Нижняя половина - информация и кнопки
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Информационный текст
                Text(
                  'Смена тарифа происходит\nна следующий день',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textBaseSecondary,
                    height: 1.4,
                  ),
                ),
                
                const SizedBox(height: 12),
                
                // Кнопка "Отменить смену тарифа"
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonBgSecondaryDefault,
                      foregroundColor: AppColors.buttonLabelSecondary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Отменить смену тарифа',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 8),
                
                // Кнопка "Подтвердить"
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      // Переходим на экран SMS подтверждения
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SmsConfirmationScreen(
                            newTariff: newTariff,
                            effectiveDate: '23.08.2025',
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonBgPrimaryDefault,
                      foregroundColor: AppColors.buttonLabelPrimary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Подтвердить',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
