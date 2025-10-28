import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/appcolors.dart';

class CategoryChip extends StatelessWidget {
  final String text;
  final IconData? icon;
  final String? iconAsset;

  const CategoryChip({
    super.key,
    required this.text,
    this.icon,
    this.iconAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: text.isEmpty 
          ? const EdgeInsets.all(8)
          : const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.bgBaseDefault,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconAsset != null)
            SvgPicture.asset(
              iconAsset!,
              width: 18,
              height: 18,
            ),
          if (icon != null)
            Icon(
              icon,
              size: 18,
              color: AppColors.textBaseDefault,
            ),
          if (text.isNotEmpty) ...[
            if (iconAsset != null || icon != null) const SizedBox(width: 4),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textBaseDefault,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

