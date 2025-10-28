import 'package:flutter/material.dart';
import 'account_list_item.dart';
import 'tariff_section.dart';
import '../screens/account_details_modal.dart';
import '../../../core/theme/appcolors.dart';
import '../../tariff/screens/tariffs_sheet_c.dart';
import '../data/accounts_data.dart';

class InvestAccountsCard extends StatelessWidget {
  const InvestAccountsCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем ИИС счет
    final iisAccount = AccountsDataSource.getAllAccounts()
        .where((account) => account.showIISIcon)
        .first;

    return Column(
      children: [
        AccountListItem(
          balance: iisAccount.balance,
          changeText: iisAccount.changeText,
          changeColor: iisAccount.changeColor,
          number: iisAccount.number,
          subtitle: iisAccount.subtitle,
          showIISIcon: iisAccount.showIISIcon,
          tariffType: iisAccount.tariffType,
          tariffTitle: iisAccount.tariffTitle,
          tariffSubtitle: iisAccount.tariffSubtitle,
          onTap: (ctx) => Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (context) => AccountDetailsScreen(
                title: iisAccount.name,
                number: iisAccount.number,
                isIIS: iisAccount.showIISIcon,
              ),
            ),
          ),
          onTariffTap: (ctx) => Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (context) => TariffsScreenC(selectedTariff: iisAccount.tariffTitle),
            ),
          ),
        ),
      ],
    );
  }
}


