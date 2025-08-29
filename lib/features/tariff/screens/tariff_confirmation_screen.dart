import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/widgets/screen_header.dart';
import '../../../core/theme/appcolors.dart';

class TariffConfirmationScreen extends StatelessWidget {
  final String newTariff;
  final String effectiveDate;

  const TariffConfirmationScreen({
    super.key,
    required this.newTariff,
    required this.effectiveDate,
  });

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: AppColors.bgBaseTertiary,
      body: Column(
        children: [
          ScreenHeader(title: 'Подтверждение'),
          // Верхняя половина - контент
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Иконка подтверждения
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.textPositiveDefault.withOpacity(0.1),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.textPositiveDefault.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.check,
                      size: 60,
                      color: AppColors.textPositiveDefault,
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Текст успеха
                  Text(
                    'Тариф успешно изменен',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPositiveDefault,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Дата вступления в силу
                  Text(
                    'Изменения вступят в силу $effectiveDate',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBaseSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          
          // Баннер автоследования
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
                 decoration: BoxDecoration(
                 color: const Color(0xFFEDECF0),
                 borderRadius: BorderRadius.circular(16),
               ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Автоследование',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textBaseDefault,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Автоследование за опытными трейдерами',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textBaseSecondary,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Место для будущей картинки
                  const SizedBox(width: 80),
                ],
              ),
            ),
          ),
          
          Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // Кнопка "Вернуться к профилю"
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      // Возвращаемся к профилю
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonBgSecondaryDefault,
                      foregroundColor: AppColors.buttonLabelSecondary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Вернуться к профилю',
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
