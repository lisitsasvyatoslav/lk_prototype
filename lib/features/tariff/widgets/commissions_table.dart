import 'package:flutter/material.dart';
import '../../../core/theme/appcolors.dart';

class CommissionsTable extends StatelessWidget {
  const CommissionsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Московская биржа и СПБ Биржа
        _buildCommissionSection(
          'Московская биржа и СПБ Биржа',
          [
            _buildCommissionItem('0 %', 'комиссия брокера за покупку'),
            _buildCommissionItem('0,28 %', 'комиссия брокера за продажу'),
          ],
        ),
        
        const SizedBox(height: 16),
        
        // Фьючерсы
        _buildCommissionSection(
          'Фьючерсы',
          [
            _buildCommissionItem('0,45 ₽', 'за контракт'),
          ],
        ),
        
        const SizedBox(height: 16),
        
        // Драгоценные металлы
        _buildCommissionSection(
          'Драгоценные металлы',
          [
            _buildCommissionItem('0,3 %', 'не включая оборот по сделкам своп'),
          ],
        ),
        
        const SizedBox(height: 16),
        
        // Иностранные ценные бумаги
        _buildCommissionSection(
          'Иностранные ценные бумаги',
          [
            _buildCommissionItem('0 %', 'комиссия брокера за покупку'),
            _buildCommissionItem('0,28 %', 'комиссия брокера за продажу'),
          ],
        ),
        
        const SizedBox(height: 16),
        
        // Валюта
        _buildCommissionSection(
          'Валюта',
          [
            _buildCommissionItem('0,03682 %', 'при обороте в день до млн ₽ (мин., ₽ за поручение)'),
          ],
        ),
      ],
    );
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
