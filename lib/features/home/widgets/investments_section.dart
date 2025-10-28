import 'package:flutter/material.dart';
import '../../../core/theme/appcolors.dart';
import 'investment_card.dart';

class InvestmentsSection extends StatelessWidget {
  const InvestmentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Инвест привлекательность',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBaseDefault,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'См. все',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.bgBrandDefault,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Row(
              children: [
                InvestmentCard(
                  iconAsset: '../../../../assets/icons/main_screen/rosneft_symbol.svg',
                  name: 'Raiffeisen Bank Int.',
                  exchange: 'NASDAQ',
                  changeText: '0,00%',
                  isPositiveChange: false,
                  price: '18,69',
                  currency: 'RUB',
                  chartAsset: '../../../../assets/icons/main_screen/chart_1.svg',
                ),
                SizedBox(width: 8),
                InvestmentCard(
                  iconAsset: '../../../../assets/icons/main_screen/rosneft_symbol.svg',
                  name: 'YD1!',
                  exchange: 'NYSE',
                  changeText: '0,00%',
                  isPositiveChange: false,
                  price: '4 257',
                  currency: 'USD',
                  chartAsset: '../../../../assets/icons/main_screen/chart_2.svg',
                ),
                SizedBox(width: 8),
                InvestmentCard(
                  iconAsset: '../../../../assets/icons/main_screen/rosneft_symbol.svg',
                  name: 'Sample Stock 3',
                  exchange: 'NASDAQ',
                  changeText: '+2,50%',
                  isPositiveChange: true,
                  price: '125,50',
                  currency: 'USD',
                  chartAsset: '../../../../assets/icons/main_screen/chart_1.svg',
                ),
                SizedBox(width: 8),
                InvestmentCard(
                  iconAsset: '../../../../assets/icons/main_screen/rosneft_symbol.svg',
                  name: 'Sample Stock 4',
                  exchange: 'NYSE',
                  changeText: '-1,20%',
                  isPositiveChange: false,
                  price: '89,34',
                  currency: 'USD',
                  chartAsset: '../../../../assets/icons/main_screen/chart_2.svg',
                ),
                SizedBox(width: 8),
                InvestmentCard(
                  iconAsset: '../../../../assets/icons/main_screen/rosneft_symbol.svg',
                  name: 'Sample Stock 5',
                  exchange: 'NASDAQ',
                  changeText: '+0,85%',
                  isPositiveChange: true,
                  price: '245,67',
                  currency: 'USD',
                  chartAsset: '../../../../assets/icons/main_screen/chart_1.svg',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

