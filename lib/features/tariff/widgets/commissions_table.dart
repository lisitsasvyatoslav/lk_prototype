import 'package:flutter/material.dart';
import '../../../core/theme/appcolors.dart';

class CommissionsTable extends StatelessWidget {
  final List<Map<String, dynamic>>? commissionData;
  
  const CommissionsTable({super.key, this.commissionData});

  @override
  Widget build(BuildContext context) {
    // Если данные не переданы, используем дефолтные
    final data = commissionData ?? _getDefaultCommissionData();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: data.map((section) => Column(
        children: [
          _buildCommissionSection(
            section['title'],
            (section['items'] as List).map((item) => 
              _buildCommissionItem(item['value'], item['description'])
            ).toList(),
          ),
          const SizedBox(height: 16),
        ],
      )).toList(),
    );
  }

  List<Map<String, dynamic>> _getDefaultCommissionData() {
    return [
      {
        'title': 'Московская биржа и СПБ Биржа',
        'items': [
          {'value': '0 %', 'description': 'комиссия брокера за покупку'},
          {'value': '0,28 %', 'description': 'комиссия брокера за продажу'},
        ],
      },
      {
        'title': 'Фьючерсы',
        'items': [
          {'value': '0,45 ₽', 'description': 'за контракт'},
        ],
      },
      {
        'title': 'Драгоценные металлы',
        'items': [
          {'value': '0,3 %', 'description': 'не включая оборот по сделкам своп'},
        ],
      },
      {
        'title': 'Иностранные ценные бумаги',
        'items': [
          {'value': '0 %', 'description': 'комиссия брокера за покупку'},
          {'value': '0,28 %', 'description': 'комиссия брокера за продажу'},
        ],
      },
      {
        'title': 'Валюта',
        'items': [
          {'value': '0,03682 %', 'description': 'при обороте в день до млн ₽ (мин., ₽ за поручение)'},
        ],
      },
    ];
  }

  Widget _buildCommissionSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.textBaseDefault,
          ),
        ),
        const SizedBox(height: 8),
        ...items,
      ],
    );
  }

  Widget _buildCommissionItem(String value, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textBaseDefault,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textBaseTertiary,
            ),
          ),
        ],
      ),
    );
  }
}
