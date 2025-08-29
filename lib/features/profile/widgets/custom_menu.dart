import 'package:flutter/material.dart';
import '../../../core/theme/appcolors.dart';

class MenuItemData {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const MenuItemData({
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });
}

class CustomMenu extends StatelessWidget {
  final List<MenuItemData> items;

  const CustomMenu({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgBaseDefault,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: items
            .map(
              (item) => _MenuItem(
                icon: item.icon,
                title: item.title,
                trailing: item.trailing,
                onTap: item.onTap,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _MenuItem({
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(icon, color: AppColors.iconBaseDefault, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.textBaseDefault,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            if (trailing != null) trailing!,
            Icon(Icons.chevron_right, color: AppColors.iconBaseSecondary),
          ],
        ),
      ),
    );
  }
}

class CustomBadge extends StatelessWidget {
  final String text;

  const CustomBadge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: AppColors.bgBaseSecondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(color: AppColors.textBaseSecondary, fontSize: 12),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final String text;
  final bool isLarge;

  const Counter({super.key, required this.text, this.isLarge = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.bgBrandDefault,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.buttonLabelPrimary,
          fontSize: isLarge ? 13 : 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
