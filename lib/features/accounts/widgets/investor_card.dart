import 'package:flutter/material.dart';
import '../../../core/widgets/tariff_row.dart';
import '../../tariff/screens/tariffs_sheet_c.dart';

class InvestorCard extends StatelessWidget {
  final String tariffTitle;
  final String tariffSubtitle;
  final String tariffIcon;
  final double tariffIconSize;
  final List<Color> tariffGradient;

  const InvestorCard({
    super.key,
    required this.tariffTitle,
    required this.tariffSubtitle,
    required this.tariffIcon,
    required this.tariffIconSize,
    required this.tariffGradient,
  });

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
            title: tariffTitle,
            subtitle: tariffSubtitle,
            svgIcon: tariffIcon,
            iconSize: tariffIconSize,
            gradient: tariffGradient,
            tariffName: tariffTitle,
          ),
        ],
      ),
    );
  }
}


