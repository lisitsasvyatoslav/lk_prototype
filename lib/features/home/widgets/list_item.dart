import 'package:flutter/material.dart';
import '../../../core/theme/appcolors.dart';

class ListItem extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const ListItem({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.textBaseDefault,
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 16,
              color: AppColors.iconBaseSecondary,
            ),
          ],
        ),
      ),
    );
  }
}

