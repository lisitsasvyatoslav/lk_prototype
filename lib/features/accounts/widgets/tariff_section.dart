import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/typography/text_12_medium.dart';
import '../../../core/typography/text_10_regular.dart';
import '../../../core/theme/appcolors.dart';

enum TariffType { premium, portfolio, daily, longTerm, strategist, consultative }

class TariffSection extends StatelessWidget {
  final TariffType? tariffType;
  final String? tariffTitle;
  final String? tariffSubtitle;
  final void Function(BuildContext context, String tariffTitle)? onTariffTap;

  const TariffSection({
    super.key,
    this.tariffType,
    this.tariffTitle,
    this.tariffSubtitle,
    this.onTariffTap,
  });

  Color _getTariffBackgroundColor() {
    switch (tariffType) {
      case TariffType.premium:
        return const Color(0xFF82746B).withOpacity(0.1); // #82746B 10%
      case TariffType.portfolio:
        return const Color(0xFFFF91C1).withOpacity(0.1); // #FF91C1 10%
      case TariffType.daily:
        return const Color(0xFFFFB23F).withOpacity(0.1); // #FFB23F 10%
      case TariffType.longTerm:
        return const Color(0xFF6FFF22).withOpacity(0.1); // #6FFF22 10%
      case TariffType.strategist:
        return const Color(0xFF93C7FF).withOpacity(0.1); // #93C7FF 10%
      case TariffType.consultative:
        return const Color(0xFFFF7A7C).withOpacity(0.1); // #FF7A7C 10%
      default:
        return const Color(0xFFF9F9F9); // Текущий цвет по умолчанию
    }
  }

  Widget _buildTariffIcon() {
    switch (tariffType) {
      case TariffType.premium:
        return Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: _getTariffBackgroundColor(),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.gradientsTextSmallStart, AppColors.gradientsTextSmallEnd],
              ).createShader(bounds),
              child: SvgPicture.asset(
                'assets/icons/diamond.svg',
                width: 20.5,
                height: 20.5,
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
        );
      case TariffType.portfolio:
        return Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: _getTariffBackgroundColor(),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/chart_forest.svg',
              width: 20.5,
              height: 20.5,
            ),
          ),
        );
      case TariffType.daily:
        return Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: _getTariffBackgroundColor(),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/daily_tariff.svg',
              width: 20.5,
              height: 20.5,
            ),
          ),
        );
      case TariffType.longTerm:
        return Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: _getTariffBackgroundColor(),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/wallet_transfer_send.svg',
              width: 20.5,
              height: 20.5,
            ),
          ),
        );
      case TariffType.strategist:
        return Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: _getTariffBackgroundColor(),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/rocket.24.svg',
              width: 20.5,
              height: 20.5,
            ),
          ),
        );
      case TariffType.consultative:
        return Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: _getTariffBackgroundColor(),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/bubble.chart.24.svg',
              width: 20.5,
              height: 20.5,
            ),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (tariffType == null) return const SizedBox.shrink();

    return Column(
      children: [
        const SizedBox(height: 12),
        const Divider(
          height: 1,
          thickness: 1,
          color: AppColors.borderBaseDefault,
        ),
        const SizedBox(height: 12),
        
        // Тариф секция
        GestureDetector(
          onTap: onTariffTap != null && tariffTitle != null 
            ? () => onTariffTap!(context, tariffTitle!)
            : null,
          child: Row(
            children: [
              // Иконка тарифа
              _buildTariffIcon(),
              const SizedBox(width: 8),
              // Текст тарифа
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text12Medium(
                      text: tariffTitle ?? '',
                      color: AppColors.textBaseDefault,
                    ),
                    Text10Regular(
                      text: tariffSubtitle ?? 'Текущий тариф',
                      color: AppColors.textBaseSecondary,
                    ),
                  ],
                ),
              ),
              // Стрелка справа
              const Icon(
                CupertinoIcons.chevron_right,
                color: AppColors.iconBaseTertiary,
                size: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
