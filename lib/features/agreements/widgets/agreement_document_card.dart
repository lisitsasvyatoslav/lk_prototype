import 'package:flutter/material.dart';
import '../../../core/theme/appcolors.dart';

class AgreementDocumentCard extends StatelessWidget {
  final String title;
  final String date;
  final String metadata;
  final VoidCallback onTap;
  final bool showDivider;

  const AgreementDocumentCard({
    super.key,
    required this.title,
    required this.date,
    required this.metadata,
    required this.onTap,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: showDivider ? const EdgeInsets.only(bottom: 12) : EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          padding: showDivider ? const EdgeInsets.all(16) : EdgeInsets.zero,
          decoration: showDivider ? BoxDecoration(
            color: AppColors.bgBaseDefault,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.opacityBase16,
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ) : null,
          child: Row(
            children: [
              // Иконка документа
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.opacityBase16,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Icon(
                  Icons.description_outlined,
                  size: 24,
                  color: AppColors.iconBaseSecondary,
                ),
              ),
              
              const SizedBox(width: 12),
              
              // Название соглашения
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textBaseSecondary,
                    height: 1.3,
                  ),
                ),
              ),
              
              const SizedBox(width: 12),
              
              // Дата справа
              if (date.isNotEmpty)
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textBaseSecondary,
                    height: 1.3,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
