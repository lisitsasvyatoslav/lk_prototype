import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/appcolors.dart';
import 'tariff_change_screen.dart';
import '../widgets/tariff_agreements_button.dart';

void showTariffChangeModal(BuildContext context, {bool isPersonalTariff = false}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => TariffChangeModal(isPersonalTariff: isPersonalTariff),
  );
}

class TariffChangeModal extends StatelessWidget {
  final bool isPersonalTariff;
  
  const TariffChangeModal({super.key, this.isPersonalTariff = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               Row(
                 children: [
                   const SizedBox(width: 48), // Заглушка для баланса
                   const Expanded(
                     child: Text(
                       'Смена тарифа',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontSize: 17,
                         fontWeight: FontWeight.w500,
                         color: Color(0xFF303441),
                       ),
                     ),
                   ),
                   IconButton(
                     icon: const Icon(Icons.close, size: 24),
                     onPressed: () => Navigator.of(context).pop(),
                   ),
                 ],
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
                              builder: (context) => const TariffChangeScreen(
                                currentTariff: 'Инвестор',
                                newTariff: 'Долгосрочный портфель',
                                currentTariffCost: 'Бесплатно',
                                newTariffCost: '200 ₽/мес',
                                currentTariffDate: 'с 23 дек 2023',
                                newTariffDate: 'с 23 авг 2025',
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
