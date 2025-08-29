import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/badge.dart';
import '../../../core/typography/text_15_semibold.dart';
import '../../../core/typography/text_15_regular.dart';
import '../../../core/typography/text_11_regular.dart';
import '../../../core/theme/appcolors.dart';

class AccountRow extends StatelessWidget {
  final String balance;
  final String changeText;
  final Color changeColor;
  final String number;
  final String subtitle;
  final String? secondaryLine;
  final String? badge;
  final bool isFavorite;
  final void Function(BuildContext context)? onTap;

  const AccountRow({
    super.key,
    required this.balance,
    required this.changeText,
    required this.changeColor,
    required this.number,
    required this.subtitle,
    this.secondaryLine,
    this.badge,
    this.isFavorite = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap == null ? null : () => onTap!(context),
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Text15Semibold(
                          text: balance,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text15Regular(
                        text: changeText,
                        color: changeColor,
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 6,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text11Regular(text: number, color: AppColors.textBaseSecondary),
                      Text11Regular(text: '•', color: AppColors.textBaseSecondary),
                      Text11Regular(text: subtitle, color: AppColors.textBaseSecondary),
                      if (badge != null)
                         CustomBadge(text: badge!),
                    ],
                  ),
                  if (secondaryLine != null) ...[
                    Text(
                      secondaryLine!,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textBaseTertiary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 12),
            Row(
              children: [
                if (isFavorite)
                  const Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(CupertinoIcons.star_fill, color: AppColors.iconBaseTertiary, size: 20),
                  ),
                const Icon(CupertinoIcons.chevron_right, color: AppColors.iconBaseTertiary, size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


