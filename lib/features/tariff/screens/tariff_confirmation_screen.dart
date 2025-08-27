import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/widgets/screen_header.dart';

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
       backgroundColor: const Color(0xFFF2F4F6),
               appBar: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: ScreenHeader(
            title: 'Подтверждение',
            backgroundColor: const Color(0xFFF2F4F6),
            titleColor: const Color(0xFF303441),
            iconColor: const Color(0xFF303441),
          ),
        ),
      body: Column(
        children: [
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
                      color: const Color(0xFFE8F5E8),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF4CAF50).withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 60,
                      color: Color(0xFF4CAF50),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Текст успеха
                  Text(
                    'Тариф успешно изменен',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF4CAF50),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Дата вступления в силу
                  Text(
                    'Изменения вступят в силу $effectiveDate',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6B7280),
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
                 color: const Color(0xFFECEEF0),
                 borderRadius: BorderRadius.circular(16),
               ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Автоследование',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF303441),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Автоследование за опытными трейдерами',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6B7280),
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
                      backgroundColor: const Color(0xFFE6E6EE),
                      foregroundColor: const Color(0xFF303441),
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
