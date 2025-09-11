import 'package:flutter/material.dart';
import '../screens/tariffs_sheet_a.dart';

void navigateToTariffsScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const TariffsScreen(),
    ),
  );
}
