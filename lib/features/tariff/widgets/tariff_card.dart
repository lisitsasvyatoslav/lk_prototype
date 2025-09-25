import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/tariff_change_modal.dart';
import '../screens/account_selection_modal.dart';
import '../../../core/theme/appcolors.dart';

class TariffCharacteristic {
  final String name;
  final String value;

  const TariffCharacteristic({
    required this.name,
    required this.value,
  });
}

class TariffCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String price;
  final String priceDetail;
  final Widget icon;
  final String buttonText;
  final bool isPersonalTariff;
  final Color? iconBackgroundColor;
  final double? iconSize;
  final List<TariffCharacteristic> characteristics;
  final String? iconPath;

  const TariffCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.price,
    required this.priceDetail,
    required this.icon,
    required this.buttonText,
    this.isPersonalTariff = false,
    this.iconBackgroundColor,
    this.iconSize,
    this.characteristics = const [],
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Иконка
            Center(
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: iconBackgroundColor ?? const Color(0xFFF9F9F9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: icon,
                ),
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Заголовок
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBaseDefault,
                ),
              ),
            ),
            
            const SizedBox(height: 8),
            
            // Описание
            Center(
              child: Text(
                description,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textOnLightDefault,
                  height: 1.3,
                ),
              ),
            ),
            
            const SizedBox(height: 8),
            
            // Цена
            Center(
              child: Text(
                price,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: price == 'Бесплатно' 
                    ? AppColors.textPositiveDefault 
                    : AppColors.textOnBrandDefault,
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Характеристики тарифа
            if (characteristics.isNotEmpty) ...[
              Column(
                children: characteristics.asMap().entries.map((entry) {
                  final index = entry.key;
                  final characteristic = entry.value;
                  
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFFE5E5E7),
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          characteristic.name,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textBaseSecondary,
                          ),
                        ),
                        Text(
                          characteristic.value,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textBaseDefault,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              
              const SizedBox(height: 16),
            ],
            
            // Кнопка
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () => showAccountSelectionModal(
                  context, 
                  tariffTitle: title,
                  isPersonalTariff: isPersonalTariff,
                  tariffPrice: price,
                  tariffIcon: iconPath,
                  tariffIconSize: iconSize,
                  tariffIconBackgroundColor: iconBackgroundColor,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF3F4F6),
                  foregroundColor: const Color(0xFF000000),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
