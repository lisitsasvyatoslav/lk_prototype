import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';

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
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: showDivider ? const EdgeInsets.all(16) : EdgeInsets.zero,
          decoration: showDivider ? BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowLight,
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ) : null,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textPrimary,
                        height: 1.3,
                      ),
                    ),
                    
                    if (date.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        date,
                        style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                          color: AppColors.textPrimary,
                          height: 1.3,
                        ),
                      ),
                    ],
                    
                    const SizedBox(height: 4),
                    
                    Text(
                      metadata,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(width: 12),
              
              Icon(
                Icons.chevron_right,
                size: 20,
                color: AppColors.textLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
