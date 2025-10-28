import 'package:flutter/material.dart';
import 'ticker_card.dart';

class TickersList extends StatelessWidget {
  const TickersList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: const Row(
        children: [
          TickerCard(
            mainIconAsset: '../../../../assets/icons/main_screen/tk_flag_symbol.svg',
            secondaryIconAsset: '../../../../assets/icons/main_screen/ru_flag_symbol.svg',
            price: '96,23 ₽',
            changePercent: '+2,20%',
            isPositiveChange: true,
          ),
          SizedBox(width: 8),
          TickerCard(
            mainIconAsset: '../../../../assets/icons/main_screen/us_flag_symbol.svg',
            secondaryIconAsset: '../../../../assets/icons/main_screen/ru_flag_symbol.svg',
            price: '89,90 ₽',
            changePercent: '+0,06%',
            isPositiveChange: true,
          ),
          SizedBox(width: 8),
          TickerCard(
            mainIconAsset: '../../../../assets/icons/main_screen/btc_symbol.svg',
            secondaryIconAsset: '../../../../assets/icons/main_screen/usdt_symbol.svg',
            price: r'$109,749',
            changePercent: '+1,43%',
            isPositiveChange: true,
          ),
        ],
      ),
    );
  }
}

