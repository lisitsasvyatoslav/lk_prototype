import 'package:flutter/material.dart';
import 'accounts_list_sheet.dart';

void showAccountsListModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFFF2F4F6),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (ctx) {
      final height = MediaQuery.of(ctx).size.height * 0.95;
      return SizedBox(
        height: height,
        child: const AccountsListSheet(),
      );
    },
  );
}
