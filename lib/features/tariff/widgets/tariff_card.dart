import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/tariff_change_modal.dart';

class TariffCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget icon;
  final List<Map<String, String>> services;
  final String maintenanceFee;
  final String buttonText;
  final bool isPersonalTariff;
  final Color? iconBackgroundColor;
  final double? iconSize;

  const TariffCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.services,
    required this.maintenanceFee,
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: iconBackgroundColor ?? const Color(0xFFF9F9F9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Transform.scale(
                        scale: 1,
                        child: icon,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF303441),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF5E6472),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            ...services.map((service) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      service['name']!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF303441),
                      ),
                    ),
                    Text(
                      service['fee']!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF303441),
                      ),
                    ),
                  ],
                ),
                const Divider(height: 24, color: Color(0xFFF0F1F4)),
              ],
            )),
            
            const SizedBox(height: 16),
            
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () => showTariffChangeModal(context, isPersonalTariff: isPersonalTariff),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  foregroundColor: const Color(0xFF303441),
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
