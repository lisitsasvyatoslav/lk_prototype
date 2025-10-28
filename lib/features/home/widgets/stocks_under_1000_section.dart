import 'package:flutter/material.dart';
import '../../../core/theme/appcolors.dart';
import 'investment_card.dart';

class StocksUnder1000Section extends StatelessWidget {
  const StocksUnder1000Section({super.key});

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
                'Акции до 1000',
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
                  name: 'Альфабанк',
                  exchange: 'MOEX',
                  changeText: '0,54%',
                  isPositiveChange: true,
                  price: '4 125,0',
                  currency: 'RUB',
                  chartAsset: '../../../../assets/icons/main_screen/chart_2.svg',
                ),
                SizedBox(width: 8),
                InvestmentCard(
                  iconAsset: '../../../../assets/icons/main_screen/rosneft_symbol.svg',
                  name: 'СБП',
                  exchange: 'MOEX',
                  changeText: '0,10%',
                  isPositiveChange: false,
                  price: '56,76',
                  currency: 'RUB',
                  chartAsset: '../../../../assets/icons/main_screen/chart_1.svg',
                ),
                SizedBox(width: 8),
                InvestmentCard(
                  iconAsset: '../../../../assets/icons/main_screen/rosneft_symbol.svg',
                  name: 'Газпром',
                  exchange: 'MOEX',
                  changeText: '+1,25%',
                  isPositiveChange: true,
                  price: '265,50',
                  currency: 'RUB',
                  chartAsset: '../../../../assets/icons/main_screen/chart_2.svg',
                ),
                SizedBox(width: 8),
                InvestmentCard(
                  iconAsset: '../../../../assets/icons/main_screen/rosneft_symbol.svg',
                  name: 'Лукойл',
                  exchange: 'MOEX',
                  changeText: '-0,85%',
                  isPositiveChange: false,
                  price: '8 420,0',
                  currency: 'RUB',
                  chartAsset: '../../../../assets/icons/main_screen/chart_1.svg',
                ),
                SizedBox(width: 8),
                InvestmentCard(
                  iconAsset: '../../../../assets/icons/main_screen/rosneft_symbol.svg',
                  name: 'Сбер',
                  exchange: 'MOEX',
                  changeText: '+2,15%',
                  isPositiveChange: true,
                  price: '325,45',
                  currency: 'RUB',
                  chartAsset: '../../../../assets/icons/main_screen/chart_2.svg',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

