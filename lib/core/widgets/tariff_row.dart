import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/appcolors.dart';
import '../../features/tariff/screens/tariffs_sheet_a.dart';

class TariffRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;
  final String? svgIcon;
  final double? iconSize;
  final List<Color> gradient;
  final VoidCallback? onTap;
  final String? tariffName; // Название тарифа для передачи на экран тарифов

  const TariffRow({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
    this.svgIcon,
    this.iconSize,
    required this.gradient,
    this.onTap,
    this.tariffName,
  });

  // Метод для создания onTap с передачей тарифа
  static VoidCallback createTariffOnTap(BuildContext context, String tariffName) {
    return () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TariffsScreen(selectedTariff: tariffName),
        ),
      );
    };
  }

  // Метод для создания onTap с использованием tariffName из параметров
  VoidCallback? _createDefaultOnTap(BuildContext context) {
    if (tariffName != null) {
      return () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TariffsScreen(selectedTariff: tariffName!),
          ),
        );
      };
    }
    return null;
  }

  Widget _buildSubtitleText(String subtitle) {
    // Разделяем subtitle на цену и дату по разделителю " • "
    final parts = subtitle.split(' • ');
    if (parts.length != 2) {
      // Если формат не соответствует ожидаемому, возвращаем обычный текст
      return Text(
        subtitle,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: AppColors.textBaseSecondary,
        ),
      );
    }

    final price = parts[0].trim();
    final date = parts[1].trim();
    final isFree = price.toLowerCase().contains('бесплатно');

    return RichText(
      text: TextSpan(
        children: [
          // Цена
          TextSpan(
            text: price,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isFree ? FontWeight.w400 : FontWeight.w500,
              color: isFree ? AppColors.textBaseSecondary : AppColors.textOnLightDefault,
            ),
          ),
          // Разделительная точка
          TextSpan(
            text: ' • ',
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.textBaseSecondary,
            ),
          ),
          // Дата
          TextSpan(
            text: date,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.textBaseSecondary,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Используем переданный onTap или создаем автоматический на основе tariffName
    final effectiveOnTap = onTap ?? _createDefaultOnTap(context);
    
    Widget rowContent = Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: gradient
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: svgIcon != null
                ? SizedBox(
                    width: iconSize ?? 20.53,
                    height: iconSize ?? 20.53,
                    child: Center(
                      child: Transform.scale(
                        scale: (iconSize ?? 20.53) / 28, // Масштабируем относительно базового размера 28
                        child: SvgPicture.asset(
                          svgIcon!,
                          width: 28,
                          height: 28,
                        ),
                      ),
                    ),
                  )
                : Icon(icon, color: Colors.white, size: iconSize ?? 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title, 
                  style: const TextStyle(
                    fontSize: 15, 
                    fontWeight: FontWeight.w600, 
                    color: AppColors.textBaseDefault
                  )
                ),
                const SizedBox(height: 2),
                _buildSubtitleText(subtitle),
              ],
            ),
          ),
          if (effectiveOnTap != null)
            const Icon(Icons.chevron_right, color: Color(0xFF9AA0AA)),
        ],
      ),
    );

    if (effectiveOnTap != null) {
      return InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: effectiveOnTap,
        child: rowContent,
      );
    }

    return rowContent;
  }
}
