import 'account_list_item.dart';
import 'tariff_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/account_details_modal.dart';
import '../../tariff/screens/tariffs_sheet_c.dart';
import '../../../core/theme/appcolors.dart';
import '../data/accounts_data.dart';

class AccountsCard extends StatelessWidget {
  const AccountsCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем первые 4 счета (не ИИС)
    final brokerAccounts = AccountsDataSource.getAllAccounts()
        .where((account) => !account.showIISIcon)
        .toList();

    return Column(
      children: brokerAccounts.map((accountData) {
        return Column(
          children: [
            AccountListItem(
              balance: accountData.balance,
              changeText: accountData.changeText,
              changeColor: accountData.changeColor,
              number: accountData.number,
              subtitle: accountData.subtitle,
              isFavorite: accountData.isFavorite,
              tariffType: accountData.tariffType,
              tariffTitle: accountData.tariffTitle,
              tariffSubtitle: accountData.tariffSubtitle,
              onTap: (ctx) => Navigator.of(ctx).push(
                MaterialPageRoute(
                  builder: (context) => AccountDetailsScreen(
                    title: accountData.name,
                    number: accountData.number,
                  ),
                ),
              ),
              onTariffTap: (ctx) => Navigator.of(ctx).push(
                MaterialPageRoute(
                  builder: (context) => TariffsScreenC(selectedTariff: accountData.tariffTitle),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        );
      }).toList(),
    );
  }
}
