import 'account_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/account_details_modal.dart';
import '../../tariff/screens/tariffs_sheet.dart';
import '../../tariff/screens/premium_tariff_screen.dart';
import '../../../core/theme/appcolors.dart';

class AccountsCard extends StatelessWidget {
  const AccountsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Первый счет - Premium с отрицательным изменением
        AccountListItem(
          balance: '1 593 742,90 ₽',
          changeText: '−2947,23 ₽',
          changeColor: AppColors.textNegativeDefault,
          number: '15185RI112B',
          subtitle: 'Деньги на ветер',
          isFavorite: true,
          tariffType: TariffType.premium,
          tariffTitle: 'Премиум',
          tariffSubtitle: 'Текущий тариф',
          onTap: (ctx) => Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (context) => AccountDetailsScreen(
                title: 'Деньги на ветер',
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
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const PremiumTariffScreen(),
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Второй счет - Portfolio с положительным изменением
        AccountListItem(
          balance: '448 742,90 ₽',
          changeText: '+2947,23 ₽',
          changeColor: AppColors.textPositiveDefault,
          number: '15185RI112B',
          subtitle: 'Demo',
          tariffType: TariffType.portfolio,
          tariffTitle: 'Долгосрочный портфель',
          tariffSubtitle: 'Текущий тариф',
          onTap: (ctx) => Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (context) => AccountDetailsScreen(
                title: 'Demo',
                number: '15185RI112B',
              ),
            ),
          ),
          onTariffTap: (ctx) => Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (context) => const TariffsScreen(),
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Третий счет - Portfolio с нулевым изменением
        AccountListItem(
          balance: '448 742,90 ₽',
          changeText: '0,00 ₽',
          changeColor: AppColors.textBaseSecondary,
          number: '15185RI112B',
          subtitle: 'Demo',
          tariffType: TariffType.portfolio,
          tariffTitle: 'Долгосрочный портфель',
          tariffSubtitle: 'Текущий тариф',
          onTap: (ctx) => Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (context) => AccountDetailsScreen(
                title: 'Demo',
                number: '15185RI112B',
              ),
            ),
          ),
          onTariffTap: (ctx) => Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (context) => const TariffsScreen(),
            ),
          ),
        ),
      ],
    );
  }
}
