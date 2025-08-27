import 'package:flutter/material.dart';
import '../../../core/widgets/table_head_text.dart';
import '../../../core/widgets/table_cell_text.dart';

class AccountSectionsTable extends StatelessWidget {
  const AccountSectionsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = const [
      ['76761ik', 'ФОРТС', '28 авг 2024'],
      ['2D01M/2D01M', 'ММВБ', '28 сен 2024'],
      ['2D01N/2D01N', 'ММВБ', '28 окт 2024'],
      ['2D01R/2D01R', 'ФБ СПБ (ИЦБ)', '28 окт 2024'],
      ['80LN8/80LN8', 'OTC валюта', '28 ноя 2024'],
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          child: Row(
            children: const [
              Expanded(flex: 4, child: TableHeadText(text: 'Торговый код')),
              Expanded(flex: 3, child: TableHeadText(text: 'Тип')),
              Expanded(flex: 3, child: TableHeadText(text: 'Дата', textAlign: TextAlign.right)),
            ],
          ),
        ),
        Container(
          color: Colors.transparent,
          child: Column(
            children: [
              for (int i = 0; i < rows.length; i++) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 4, 8),
                  child: Row(
                    children: [
                      Expanded(flex: 4, child: TableCellText(text: rows[i][0])),
                      Expanded(flex: 3, child: TableCellText(text: rows[i][1])),
                      Expanded(flex: 3, child: TableCellText(text: rows[i][2], textAlign: TextAlign.right)),
                    ],
                  ),
                ),
                if (i != rows.length - 1)
                  const Divider(height: 1, color: Color(0xFFEBEBF2)),
              ],
            ],
          ),
        ),
      ],
    );
  }
}


