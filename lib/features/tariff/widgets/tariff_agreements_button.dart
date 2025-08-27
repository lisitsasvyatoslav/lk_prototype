import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../agreements/widgets/agreements_modal.dart';

class TariffAgreementsButton extends StatelessWidget {
  const TariffAgreementsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: () => showAgreementsModal(context),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        icon: const Icon(
          Icons.description_outlined,
          size: 20,
          color: AppColors.grey500,
        ),
        label: const Text(
          'Соглашения по тарифу',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.grey500,
          ),
        ),
      ),
    );
  }
}
