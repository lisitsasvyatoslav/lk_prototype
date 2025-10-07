import 'account_list_item.dart';
import 'tariff_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/account_details_modal.dart';
import '../../tariff/screens/tariffs_sheet_a.dart';
import '../../tariff/screens/premium_tariff_screen.dart';
import '../../../core/theme/appcolors.dart';

class AccountsCard extends StatelessWidget {
  const AccountsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1-й счет - Премиум с отрицательным изменением
        AccountListItem(
          balance: '1 593 742,90 ₽',
          changeText: '−2947,23 ₽',
          changeColor: AppColors.textNegativeDefault,
          number: '15185RI112B',
          subtitle: '123234',
          isFavorite: true,
          tariffType: TariffType.premium,
          tariffTitle: 'Премиум',
          tariffSubtitle: 'Текущий тариф',
          onTap: (ctx) => Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (context) => AccountDetailsScreen(
                title: '123234',
                number: '15185RI112B',
              ),
            ),
          ),
          onTariffTap: (ctx) => showModalBottomSheet(
            context: ctx,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 0.95,
              decoration: const BoxDecoration(
                color: Color(0xFFF2F4F6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: const PremiumTariffScreen(),
            ),
          ),
        ),
        const SizedBox(height: 8),
        // 2-й счет - Инвестор с положительным изменением
        AccountListItem(
          balance: '448 742,90 ₽',
          changeText: '+2947,23 ₽',
          changeColor: AppColors.textPositiveDefault,
          number: '15185RI112B',
          subtitle: '123234',
          isFavorite: false,
          tariffType: TariffType.portfolio,
          tariffTitle: 'Инвестор',
          tariffSubtitle: 'Текущий тариф',
          onTap: (ctx) => Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (context) => AccountDetailsScreen(
                title: '123234',
                number: '15185RI112B',
              ),
            ),
          ),
          onTariffTap: (ctx) => Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (context) => const TariffsScreen(selectedTariff: 'Инвестор'),
            ),
          ),
        ),
        const SizedBox(height: 8),
        // 3-й счет - Единый дневной с нулевым изменением
        AccountListItem(
          balance: '448 742,90 ₽',
          changeText: '0,00 ₽',
          changeColor: AppColors.textBaseSecondary,
          number: '15185RI112B',
          subtitle: '123234',
          isFavorite: false,
          tariffType: TariffType.daily,
          tariffTitle: 'Единый дневной',
          tariffSubtitle: 'Текущий тариф',
          onTap: (ctx) => Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (context) => AccountDetailsScreen(
                title: '123234',
                number: '15185RI112B',
              ),
            ),
          ),
          onTariffTap: (ctx) => Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (context) => const TariffsScreen(selectedTariff: 'Единый дневной'),
            ),
          ),
        ),
        const SizedBox(height: 8),
        // 4-й счет - Инвестор с положительным изменением
        AccountListItem(
          balance: '448 742,90 ₽',
          changeText: '+2947,93 ₽',
          changeColor: AppColors.textPositiveDefault,
          number: '15185RI112B',
          subtitle: '123234',
          isFavorite: false,
          tariffType: TariffType.portfolio,
          tariffTitle: 'Инвестор',
          tariffSubtitle: 'Текущий тариф',
          onTap: (ctx) => Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (context) => AccountDetailsScreen(
                title: '123234',
                number: '15185RI112B',
              ),
            ),
          ),
          onTariffTap: (ctx) => Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (context) => const TariffsScreen(selectedTariff: 'Инвестор'),
            ),
          ),
        ),
      ],
    );
  }
}
