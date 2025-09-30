import 'package:flutter/material.dart';
import 'account_list_item.dart';
import 'tariff_section.dart';
import '../screens/account_details_modal.dart';
import '../../../core/theme/appcolors.dart';
import '../../tariff/screens/tariffs_sheet_a.dart';

class InvestAccountsCard extends StatelessWidget {
  const InvestAccountsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AccountListItem(
          balance: '1 593 742,90 ₽',
          changeText: '−2947,23 ₽',
          changeColor: AppColors.textNegativeDefault,
          number: '15185RI112B',
          subtitle: 'Деньги на ветер',
          showIISIcon: true,
          tariffType: TariffType.longTerm,
          tariffTitle: 'Долгосрочный портфель',
          tariffSubtitle: 'Текущий тариф',
          onTap: (ctx) => Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (context) => AccountDetailsScreen(
                title: 'КЛФ-9182323',
                number: '15185RI112B',
                isIIS: true,
              ),
            ),
          ),
          onTariffTap: (ctx) => Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (context) => const TariffsScreen(selectedTariff: 'Долгосрочный портфель'),
            ),
          ),
        ),
      ],
    );
  }
}


