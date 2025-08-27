import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final VoidCallback? onClosePressed;
  final bool showCloseButton;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? subtitleColor;
  final Color? iconColor;

  const ScreenHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.showBackButton = true,
    this.onBackPressed,
    this.onClosePressed,
    this.showCloseButton = true,
    this.backgroundColor,
    this.titleColor,
    this.subtitleColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Левая иконка (кнопка назад)
            if (showBackButton)
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: 24,
                    color: iconColor ?? const Color(0xFF91909B),
                  ),
                  onPressed: onBackPressed ?? () => Navigator.of(context).maybePop(),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                  ),
                ),
              ),
            
            // Центральный контент
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: titleColor ?? Colors.black,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 12,
                      color: subtitleColor ?? const Color(0xFF9AA0AA),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ],
            ),
            
            // Правая иконка (кнопка закрытия)
            if (showCloseButton)
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 24,
                    color: iconColor ?? const Color(0xFF91909B),
                  ),
                  onPressed: onClosePressed ?? () => Navigator.of(context).maybePop(),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
