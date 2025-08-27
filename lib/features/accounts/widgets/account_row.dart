import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/badge.dart';
import '../../../core/widgets/text_title_15_semibold.dart';
import '../../../core/widgets/text_body_15_medium.dart';
import '../../../core/widgets/text_caption_11.dart';

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
                        child: TextTitle15Semibold(
                          text: balance,
                          overflow: true,
                        ),
                      ),
                      const SizedBox(width: 6),
                      TextBody15Medium(
                        text: changeText,
                        color: changeColor,
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 6,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      TextCaption11(text: number),
                      TextCaption11(text: '•'),
                      TextCaption11(text: subtitle),
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
                        color: Color(0xCC8E8E93),
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
                    child: Icon(CupertinoIcons.star_fill, color: Color(0xFFB0B5C0), size: 20),
                  ),
                const Icon(CupertinoIcons.chevron_right, color: Color(0xFFB0B5C0), size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


