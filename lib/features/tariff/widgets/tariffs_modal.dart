import 'package:flutter/material.dart';
import '../screens/tariffs_sheet.dart';
import '../../../core/theme/colors.dart';

void showTariffsModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.background,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (ctx) {
      final height = MediaQuery.of(ctx).size.height * 0.95;
      return SizedBox(
        height: height,
        child: const TariffsSheet(),
      );
    },
  );
}
