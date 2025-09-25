import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/appcolors.dart';
import '../../../core/widgets/modal_header.dart';
import 'tariff_change_screen.dart';
import '../widgets/tariff_agreements_button.dart';

void showTariffChangeModal(
  BuildContext context, {
  bool isPersonalTariff = false,
  String? tariffTitle,
  String? tariffPrice,
  String? tariffIcon,
  double? tariffIconSize,
  Color? tariffIconBackgroundColor,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => TariffChangeModal(
      isPersonalTariff: isPersonalTariff,
      tariffTitle: tariffTitle,
      tariffPrice: tariffPrice,
      tariffIcon: tariffIcon,
      tariffIconSize: tariffIconSize,
      tariffIconBackgroundColor: tariffIconBackgroundColor,
    ),
  );
}

class TariffChangeModal extends StatelessWidget {
  final bool isPersonalTariff;
  final String? tariffTitle;
  final String? tariffPrice;
  final String? tariffIcon;
  final double? tariffIconSize;
  final Color? tariffIconBackgroundColor;
  
  const TariffChangeModal({
    super.key, 
    this.isPersonalTariff = false,
    this.tariffTitle,
    this.tariffPrice,
    this.tariffIcon,
    this.tariffIconSize,
    this.tariffIconBackgroundColor,
  });

  String _getCurrentDateFormatted() {
    final now = DateTime.now();
    final months = [
      'янв', 'фев', 'мар', 'апр', 'май', 'июн',
      'июл', 'авг', 'сен', 'окт', 'ноя', 'дек'
    ];
    final day = now.day;
    final month = months[now.month - 1];
    final year = now.year;
    return 'с $day $month $year';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ModalHeader(
                title: 'Смена тарифа',
                onClose: () => Navigator.of(context).pop(),
              ),
              
              const SizedBox(height: 40),
              
              // Information icon
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.opacityBase16,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/info_circle.svg',
                    width: 48,
                    height: 48,
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Primary message (только для персонального тарифа)
              if (isPersonalTariff) ...[
                const Text(
                  'У вас персональный тариф\nкоторый можно сменить через\nменеджера',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBaseDefault,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 8),
              ],
              
              // Information text
              const Text(
                'При смене тарифа все ранее заключенные доп соглашения будут автоматически отменены',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textBaseSecondary,
                  height: 1.4,
                ),
              ),
              
              const SizedBox(height: 24),
              
                             // Agreements link
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8),
                 child: TariffAgreementsButton(),
               ),
              
              const SizedBox(height: 32),
              
              // Action buttons
              Column(
                children: [
                  // Cancel button
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
                        'Отменить',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Continue button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        if (isPersonalTariff) {
                          // TODO: Логика открытия чата с менеджером
                          Navigator.of(context).pop();
                        } else {
                          // Закрываем модальное окно и открываем экран смены тарифа
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TariffChangeScreen(
                                currentTariff: 'Инвестор',
                                newTariff: tariffTitle ?? 'Долгосрочный портфель',
                                currentTariffCost: 'Бесплатно',
                                newTariffCost: tariffPrice ?? '200 ₽/мес',
                                currentTariffDate: 'с 23 дек 2023',
                                newTariffDate: _getCurrentDateFormatted(),
                                newTariffIcon: tariffIcon,
                                newTariffIconSize: tariffIconSize,
                                newTariffIconBackgroundColor: tariffIconBackgroundColor,
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonBgPrimaryDefault,
                        foregroundColor: AppColors.buttonLabelPrimary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        isPersonalTariff ? 'Чат с менеджером' : 'Продолжить',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
