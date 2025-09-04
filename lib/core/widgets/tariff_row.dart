import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/appcolors.dart';

class TariffRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;
  final String? svgIcon;
  final double? iconSize;
  final List<Color> gradient;
  final VoidCallback? onTap;

  const TariffRow({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
    this.svgIcon,
    this.iconSize,
    required this.gradient,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
                Text(
                  subtitle, 
                  style: const TextStyle(
                    fontSize: 10, 
                    fontWeight: FontWeight.w400, 
                    color: AppColors.textBaseSecondary
                  )
                ),
              ],
            ),
          ),
          if (onTap != null)
            const Icon(Icons.chevron_right, color: Color(0xFF9AA0AA)),
        ],
      ),
    );

    if (onTap != null) {
      return InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: rowContent,
      );
    }

    return rowContent;
  }
}
