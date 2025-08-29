import 'package:flutter/material.dart';
import '../../../core/theme/appcolors.dart';

class AdditionalAgreementItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const AdditionalAgreementItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Row(
        children: [
          // Иконка документа
          Container(
            width: 24,
            height: 24,
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
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.textBaseSecondary,
                height: 1.3,
              ),
            ),
          ),
          
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
