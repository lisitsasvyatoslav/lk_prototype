import 'package:flutter/material.dart';
import '../../../core/typography/text_12_regular.dart';
import '../../../core/typography/text_12_medium.dart';
import '../../../core/widgets/tariff_row.dart';

class InfoCard extends StatelessWidget {
  final List<InfoRow> rows;
  const InfoCard({super.key, required this.rows});

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
          for (int i = 0; i < rows.length; i++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text12Regular(text: rows[i].label),
                  Flexible(
                    child: Text12Medium(
                      text: rows[i].value,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
            if (i != rows.length - 1)
              const Divider(height: 1, thickness: 1, color: Color(0xFFF0F1F4)),
          ],
        ],
      ),
    );
  }

  static Widget withTariffRow({
    required List<InfoRow> rows,
    required List<TariffRow> tariffRows,
  }) {
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
          for (int i = 0; i < rows.length; i++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text12Regular(text: rows[i].label),
                  Flexible(
                    child: Text12Medium(
                      text: rows[i].value,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
            if (i != rows.length - 1)
              const Divider(height: 1, thickness: 1, color: Color(0xFFF0F1F4)),
          ],
          
          if (rows.isNotEmpty && tariffRows.isNotEmpty)
            const Divider(height: 1, thickness: 1, color: Color(0xFFF0F1F4)),
          
          for (int i = 0; i < tariffRows.length; i++) ...[
            tariffRows[i],
            if (i != tariffRows.length - 1)
              const Divider(height: 1, thickness: 1, color: Color(0xFFF0F1F4)),
          ],
        ],
      ),
    );
  }
}

class InfoRow {
  final String label;
  final String value;
  const InfoRow(this.label, this.value);
}


