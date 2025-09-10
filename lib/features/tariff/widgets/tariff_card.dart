import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/tariff_change_modal.dart';
import '../screens/account_selection_modal.dart';
import '../../../core/theme/appcolors.dart';

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
            
            const SizedBox(height: 12),
            
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
            
            const SizedBox(height: 12),
            
            // Цена
            Center(
              child: Text(
                price,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPositiveDefault,
                ),
              ),
            ),
            
            const Spacer(),
            
            // Детали цены
            Center(
              child: Text(
                priceDetail,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textBaseSecondary,
                ),
              ),
            ),

            const SizedBox(height: 16),
            
            // Кнопка
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () => showAccountSelectionModal(context, tariffTitle: title),
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
