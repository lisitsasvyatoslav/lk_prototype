import 'package:flutter/material.dart';
import 'table_row.dart';

class MoscowSPBTable extends StatelessWidget {
  const MoscowSPBTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(12), 
        boxShadow: const [
          BoxShadow(
            color: const Color(0x08000000),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Оборот в день, ₽',
                  softWrap: false,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF6E6F7C),
                    height: 1.3,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: Text(
                  'Комиссия брокера',
                  textAlign: TextAlign.right,
                  softWrap: false,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF6E6F7C),
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          TariffTableRow(title: 'до 1 млн включительно', value: '0,035%'),
          const Divider(height: 1, color: Color(0xFFF0F1F4)),

          TariffTableRow(title: 'от 1 млн до 5 млн включительно', value: '0,030%'),
          const Divider(height: 1, color: Color(0xFFF0F1F4)),

          TariffTableRow(title: 'от 5 млн', value: '0,025%'),
          const Divider(height: 1, color: Color(0xFFF0F1F4)),

          const SizedBox(height: 16),

          const Text(
            'Урегулирование сделок',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF6E6F7C),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: Color(0xFFF0F1F4)),

          TariffTableRow(
            title: 'МосБиржа',
            subtitle: 'Кроме облигаций российских эмитентов',
            value: '0,03%',
          ),
          const Divider(height: 1, color: Color(0xFFF0F1F4)),

          TariffTableRow(
            title: 'МосБиржа',
            subtitle: 'Облигации российских эмитентов',
            value: '0,015%',
          ),
          const Divider(height: 1, color: Color(0xFFF0F1F4)),

          TariffTableRow(title: 'СПБ Биржа', value: '0,01%'),
          const Divider(height: 1, color: Color(0xFFF0F1F4)),
        ],
      ),
    );
  }
}
