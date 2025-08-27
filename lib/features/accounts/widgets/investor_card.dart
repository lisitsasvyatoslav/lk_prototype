import 'package:flutter/material.dart';
import '../../../core/widgets/tariff_row.dart';

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
            subtitle: 'Текущий тариф • с 23 дек 2023',
            icon: Icons.show_chart,
            gradient: const [Color(0xFF9C27B0), Color(0xFFE91E63)],
          ),
        ],
      ),
    );
  }
}


