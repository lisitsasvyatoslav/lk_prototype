import 'package:flutter/material.dart';
import 'accounts_list_sheet.dart';

void navigateToAccountsListScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const AccountsListScreen(),
    ),
  );
}
