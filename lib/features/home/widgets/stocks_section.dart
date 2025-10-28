import 'package:flutter/material.dart';
import '../../../core/theme/appcolors.dart';
import 'stock_item.dart';

class StocksSection extends StatelessWidget {
  const StocksSection({super.key});

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
                'Акции 360',
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
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              StockItem(
                iconAsset: '../../../../assets/icons/main_screen/rosneft_symbol.svg',
                name: 'Chevron',
                subtitle: 'NSDQ • Chevron Corp.',
                price: '153,61 \$',
                changeText: '+13,80\$ (2,59%)',
                isPositiveChange: true,
              ),
              StockItem(
                iconAsset: '../../../../assets/icons/main_screen/rosneft_symbol.svg',
                name: 'Shell',
                subtitle: 'MEME • Shell LLC.',
                price: '542,90 ₽',
                changeText: '+1,56₽ (1,51%)',
                isPositiveChange: true,
              ),
              StockItem(
                iconAsset: '../../../../assets/icons/main_screen/rosneft_symbol.svg',
                name: 'Kinder Morgan',
                subtitle: 'NYSE • Kinder Morgan',
                price: '210,24 \$',
                changeText: '+0,07\$ (0,28%)',
                isPositiveChange: true,
              ),
              StockItem(
                iconAsset: '../../../../assets/icons/main_screen/rosneft_symbol.svg',
                name: 'Gulf Energy Dev. LTD',
                subtitle: 'BKK • Gulf Energy Dev.',
                price: '552,38 ₽',
                changeText: '+0,07\$ (0,28%)',
                isPositiveChange: true,
              ),
              StockItem(
                iconAsset: '../../../../assets/icons/main_screen/rosneft_symbol.svg',
                name: 'The 2023 ETF Series Trust Ea...',
                subtitle: 'NSDQ • The 2023 ETF Series',
                price: '210,24 \$',
                changeText: '+0,07\$ (0,28%)',
                isPositiveChange: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}