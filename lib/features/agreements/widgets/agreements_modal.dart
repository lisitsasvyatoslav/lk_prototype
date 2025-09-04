import 'package:flutter/material.dart';
import '../screens/agreements_sheet.dart';

void navigateToAgreementsScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const AgreementsScreen(),
    ),
  );
}
