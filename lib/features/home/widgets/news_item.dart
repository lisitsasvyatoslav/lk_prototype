import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/appcolors.dart';

class NewsItem extends StatelessWidget {
  final String title;
  final String time;
  final String source;
  final List<String>? iconAssets;

  const NewsItem({
    super.key,
    required this.title,
    required this.time,
    required this.source,
    this.iconAssets,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 12, right: 12, bottom: 12),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBaseDefault,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (iconAssets != null)
                      ...iconAssets!.map((asset) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: SizedBox(
                              width: 16,
                              height: 16,
                              child: SvgPicture.asset(
                                asset,
                                width: 16,
                                height: 16,
                                fit: BoxFit.contain,
                              ),
                            ),
                          )),
                    Text(
                      '$time • $source',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textBaseSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

