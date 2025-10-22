import 'package:flutter/material.dart';
import '../../agreements/widgets/agreements_modal.dart';
import '../../../core/theme/appcolors.dart';

class TariffAgreementsButton extends StatelessWidget {
  final bool showBorder;
  
  const TariffAgreementsButton({
    super.key,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: TextButton.icon(
        onPressed: () => navigateToAgreementsScreen(context),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: showBorder 
              ? const BorderSide(
                  color: AppColors.buttonBorderOutlineDefault,
                  width: 1,
                )
              : BorderSide.none,
          ),
        ),
        icon: const Icon(
          Icons.description_outlined,
          size: 20,
          color: const Color(0xFF6B7280),
        ),
        label: const Text(
          'Соглашения по тарифу',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF6B7280),
          ),
        ),
      ),
    );
  }
}
