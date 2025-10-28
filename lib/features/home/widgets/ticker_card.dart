import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/appcolors.dart';

class TickerCard extends StatelessWidget {
  final String mainIconAsset;
  final String secondaryIconAsset;
  final String price;
  final String changePercent;
  final bool isPositiveChange;

  const TickerCard({
    super.key,
    required this.mainIconAsset,
    required this.secondaryIconAsset,
    required this.price,
    required this.changePercent,
    this.isPositiveChange = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Блок с логотипами
          Container(
            padding: const EdgeInsets.only(
              top: 8,
              left: 8,
              bottom: 8,
              right: 12,
            ),
            child: SizedBox(
              width: 29,
              height: 29,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Главный логотип (29x29)
                  Positioned(
                    left: 0,
                    top: 0,
                    child: ClipOval(
                      child: SizedBox(
                        width: 29,
                        height: 29,
                        child: SvgPicture.asset(
                          mainIconAsset,
                          width: 29,
                          height: 29,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Второй логотип (14x14) наложенный внизу справа
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.bgBaseTertiary,
                          width: 1,
                        ),
                      ),
                      child: ClipOval(
                        child: SizedBox(
                          width: 14,
                          height: 14,
                          child: SvgPicture.asset(
                            secondaryIconAsset,
                            width: 14,
                            height: 14,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Информация о цене
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBaseDefault,
                ),
              ),
              Text(
                changePercent,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: isPositiveChange
                      ? AppColors.textPositiveDefault
                      : AppColors.textNegativeDefault,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

