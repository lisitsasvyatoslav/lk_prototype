import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/agreement_document_card.dart';
import '../widgets/additional_agreement_item.dart';
import '../../../core/widgets/screen_header.dart';
import '../../../core/typography/text_18_semibold.dart';
import '../../../core/theme/appcolors.dart';

class AgreementsSheet extends StatelessWidget {
  const AgreementsSheet({super.key});

  // Данные для дополнительных соглашений
  static const List<String> _additionalAgreements = [
    'Дополнительное соглашение о продлении тарифа на новых условиях от 23/04/24',
    'Дополнительное соглашение о продлении тарифа на новых условиях от 23/04/24',
    'Дополнительное соглашение о продлении тарифа на новых условиях от 23/04/24',
    'Дополнительное соглашение о продлении тарифа на новых условиях от 23/04/24',
    'Дополнительное соглашение о продлении тарифа на новых условиях от 23/04/24',
    'Дополнительное соглашение о продлении тарифа на новых условиях от 23/04/24',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        children: [
          ScreenHeader(title: 'Соглашения по тарифу'),
          
          const SizedBox(height: 16),
          
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main agreement document card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.bgBaseDefault,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: AgreementDocumentCard(
                       title: 'Соглашение по тарифу инвестор от 17/09/23',
                       date: '17 сен., 12:12',
                       metadata: '09 августа, 20:07 • pdf',
                       onTap: () {},
                       showDivider: false,
                     ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Additional agreements section
                  Text18Semibold(
                    text: 'Дополнительные соглашения',
                    color: AppColors.textBaseDefault,
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Additional agreements list in single block
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.bgBaseDefault,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.opacityBase16,
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      children: _buildAdditionalAgreementsList(),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Метод для построения списка дополнительных соглашений
  List<Widget> _buildAdditionalAgreementsList() {
    return _additionalAgreements.asMap().entries.map((entry) {
      final index = entry.key;
      final title = entry.value;
      
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: AdditionalAgreementItem(
              title: title,
              onTap: () {},
            ),
          ),
          // Добавляем разделитель между элементами, кроме последнего
          if (index < _additionalAgreements.length - 1)
            const Divider(
              height: 1,
              thickness: 1,
              color: AppColors.borderBaseDefault,
            ),
        ],
      );
    }).toList();
  }
}
