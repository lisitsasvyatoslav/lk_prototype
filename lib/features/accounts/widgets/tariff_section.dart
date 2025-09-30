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

  Widget _buildTariffIcon() {
    switch (tariffType) {
      case TariffType.premium:
        return Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF9F9F9), Color(0xFFDFE4ED)],
            ),
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
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF9F9F9), Color(0xFFDFE4ED)],
            ),
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
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF9F9F9), Color(0xFFDFE4ED)],
            ),
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
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF9F9F9), Color(0xFFDFE4ED)],
            ),
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
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF9F9F9), Color(0xFFDFE4ED)],
            ),
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
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF9F9F9), Color(0xFFDFE4ED)],
            ),
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
                size: 8,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
