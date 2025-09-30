import 'package:flutter/material.dart';
import '../../../core/widgets/tariff_row.dart';
import '../../tariff/screens/tariffs_sheet_a.dart';

class InvestorCard extends StatelessWidget {
  const InvestorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Color(0x11000000), blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          TariffRow(
            title: 'Инвестор',
            subtitle: 'Бесплатно • с 23 дек 2023',
            svgIcon: 'assets/icons/chart_forest.svg',
            iconSize: 20.5,
            gradient: const [Color(0xFFF9F9F9), Color(0xFFDFE4ED)],
            tariffName: 'Инвестор',
          ),
        ],
      ),
    );
  }
}


