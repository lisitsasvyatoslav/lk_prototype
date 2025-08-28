import 'package:flutter/material.dart';
import 'section_label.dart';
import '../../../core/widgets/tariff_row.dart';
import '../../../core/typography/text_12_regular.dart';
import '../../../core/typography/text_12_medium.dart';

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
        const SizedBox(height: 12),
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
              TariffRow(
                title: 'Инвестор',
                subtitle: 'Текущий тариф • с 23 дек 2023',
                icon: Icons.show_chart,
                gradient: const [Color(0xFF9C27B0), Color(0xFFE91E63)],
              ),
              const Divider(height: 1, color: Color(0xFFF0F1F4)),
              TariffRow(
                title: 'Долгосрочный портфель',
                subtitle: 'Новый тариф • с 23 авг 2025',
                icon: Icons.credit_card,
                gradient: const [Color(0xFFB2FF59), Color(0xFF69F0AE)],
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





