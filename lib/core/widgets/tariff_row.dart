import 'package:flutter/material.dart';
import '../../../core/theme/appcolors.dart';

class TariffRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> gradient;
  final VoidCallback? onTap;

  const TariffRow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
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
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: gradient),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title, 
                  style: const TextStyle(
                    fontSize: 12, 
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
