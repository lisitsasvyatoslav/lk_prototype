import 'package:flutter/material.dart';
import 'section_label.dart';
import '../../../core/widgets/tariff_row.dart';
import '../../../core/typography/text_12_regular.dart';
import '../../../core/typography/text_12_medium.dart';
import '../../tariff/screens/tariffs_sheet_a.dart';

class IISSection extends StatelessWidget {
  const IISSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel('Индивидуальный Инвестиционный Счет'),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(color: Color(0x11000000), blurRadius: 8, offset: Offset(0, 2)),
            ],
          ),
          child: Column(
            children: const [
              _IisRow(label: 'Тип ИИС', value: 'ИИС'),
              Divider(height: 1, color: Color(0xFFF0F1F4)),
              _IisRow(label: 'Дата первоначального открытия', value: '30 дек 2020'),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(color: Color(0x11000000), blurRadius: 8, offset: Offset(0, 2)),
            ],
          ),
          child: Column(
            children: [
              Builder(
                builder: (context) => TariffRow(
                  title: 'Инвестор',
                  subtitle: 'Текущий тариф • с 23 дек 2023',
                  svgIcon: 'assets/icons/chart_forest.svg',
                  iconSize: 20.5,
                  gradient: const [Color(0xFFF9F9F9), Color(0xFFDFE4ED)],
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TariffsScreen(),
                    ),
                  ),
                ),
              ),
              // Секция со стрелочкой и divider
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                child: Row(
                  children: [
                    // Контейнер для стрелочки шириной 40px
                    Container(
                      width: 40,
                      child: Center(
                        child: const Icon(
                          Icons.arrow_downward,
                          color: Color(0xFF9AA0AA),
                          size: 16,
                        ),
                      ),
                    ),
                    // Divider занимает оставшуюся ширину
                    Expanded(
                      child: Container(
                        height: 1,
                        color: const Color(0xFFF0F1F4),
                        margin: const EdgeInsets.only(left: 12),
                      ),
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (context) => TariffRow(
                  title: 'Долгосрочный портфель',
                  subtitle: 'Новый тариф • с 23 авг 2025',
                  svgIcon: 'assets/icons/wallet_transfer_send.svg',
                  iconSize: 22.8,
                  gradient: const [Color(0xFFF9F9F9), Color(0xFFDFE4ED)],
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TariffsScreen(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _IisRow extends StatelessWidget {
  final String label;
  final String value;
  const _IisRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text12Regular(text: label, color: Color(0xFF5E6472)),
          Text12Medium(text: value, color: Color(0xFF303441)),
        ],
      ),
    );
  }
}





