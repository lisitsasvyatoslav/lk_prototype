import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/theme/colors.dart';
import '../widgets/agreement_document_card.dart';
import '../../../core/widgets/screen_header.dart';
import '../../../core/typography/text_20_semibold.dart';

class AgreementsSheet extends StatelessWidget {
  const AgreementsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        children: [
          const SizedBox(height: 8),
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.black12,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 12),
          ScreenHeader(title: 'Соглашения по тарифу'),
          
          const SizedBox(height: 16),
          
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main agreement document card
                  AgreementDocumentCard(
                    title: 'Соглашение по тарифу инвестор',
                    date: 'от 17/09/23',
                    metadata: '09 августа, 20:07 • pdf',
                    onTap: () {},
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Additional agreements section
                  Text20Semibold(
                    text: 'Дополнительные соглашения',
                    color: AppColors.textPrimary,
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Additional agreements list in single block
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowLight,
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // First item
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: AgreementDocumentCard(
                            title: 'Дополнительное соглашение о продлении тарифа на новых условиях от 23/04/24',
                            date: '',
                            metadata: '09 августа, 20:07 • pdf',
                            onTap: () {},
                            showDivider: false,
                          ),
                        ),
                        
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: AppColors.divider,
                        ),
                        
                        // Second item
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: AgreementDocumentCard(
                            title: 'Дополнительное соглашение 324',
                            date: '',
                            metadata: '09 августа, 20:07 • pdf',
                            onTap: () {},
                            showDivider: false,
                          ),
                        ),
                        
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: AppColors.divider,
                        ),
                        
                        // Third item
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: AgreementDocumentCard(
                            title: 'Дополнительное соглашение о продлении тарифа на новых условиях',
                            date: '',
                            metadata: '09 августа, 20:07 • pdf',
                            onTap: () {},
                            showDivider: false,
                          ),
                        ),
                        
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: AppColors.divider,
                        ),
                        
                        // Fourth item
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: AgreementDocumentCard(
                            title: 'Дополнительное соглашение о продлении тарифа на новых условиях',
                            date: '',
                            metadata: '09 августа, 20:07 • pdf',
                            onTap: () {},
                            showDivider: false,
                          ),
                        ),
                        
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: AppColors.divider,
                        ),
                        
                        // Fifth item
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: AgreementDocumentCard(
                            title: 'Дополнительное соглашение о продлении тарифа на новых условиях',
                            date: '',
                            metadata: '09 августа, 20:07 • pdf',
                            onTap: () {},
                            showDivider: false,
                          ),
                        ),
                        
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: AppColors.divider,
                        ),
                        
                        // Sixth item
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: AgreementDocumentCard(
                            title: 'Дополнительное соглашение о продлении тарифа на новых условиях',
                            date: '',
                            metadata: '09 августа, 20:07 • pdf',
                            onTap: () {},
                            showDivider: false,
                          ),
                        ),
                      ],
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
}
