import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/index.dart';
import '../../../core/theme/appcolors.dart';
import '../widgets/account_chart_card.dart';
import '../../accounts/widgets/account_list_item.dart';
import '../../accounts/widgets/tariff_section.dart';
import '../../accounts/screens/account_details_modal.dart';
import '../../tariff/screens/tariffs_sheet_c.dart';
import '../../tariff/screens/premium_tariff_screen.dart';
import '../../accounts/screens/test_list.dart';

class ProfileScreenA extends StatelessWidget {
  const ProfileScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBaseTertiary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Элементы с отступами
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  children: [
                    const UserProfileBlock(
                      avatarUrl: 'https://i.pravatar.cc/150?img=3',
                      userName: 'Александр Воронов',
                    ),
                    const SizedBox(height: 16),
                    const TipsCards(),
                    const SizedBox(height: 16),
                    const PremiumStatusCard(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              // AccountCarousel с отступами 16px с каждой стороны
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AccountCarousel(
                  cards: [
                  AccountListItem(
                    balance: '1 593 742,90 ₽',
                    changeText: '−2947,23 ₽',
                    changeColor: AppColors.textNegativeDefault,
                    number: '15185RI112B',
                    subtitle: 'Деньги на ветер',
                    isFavorite: true,
                    tariffType: TariffType.portfolio,
                    tariffTitle: 'Инвестор',
                    tariffSubtitle: 'Текущий тариф',
                    onTap: (ctx) => Navigator.of(ctx).push(
                      MaterialPageRoute(
                        builder: (context) => AccountDetailsScreen(
                          title: 'Деньги на ветер',
                          number: '15185RI112B',
                        ),
                      ),
                    ),
                    onTariffTap: (ctx) => Navigator.of(ctx).push(
                      MaterialPageRoute(
                        builder: (context) => const TariffsScreenC(selectedTariff: 'Инвестор'),
                      ),
                    ),
                  ),
                  AccountListItem(
                    balance: '1 593 742,90 ₽',
                    changeText: '0,00 ₽',
                    changeColor: AppColors.textBaseSecondary,
                    number: '15185RI112B',
                    subtitle: 'Деньги на ветер',
                    isFavorite: false,
                    tariffType: TariffType.portfolio,
                    tariffTitle: 'Инвестор',
                    tariffSubtitle: 'Текущий тариф',
                    onTap: (ctx) => Navigator.of(ctx).push(
                      MaterialPageRoute(
                        builder: (context) => AccountDetailsScreen(
                          title: 'Деньги на ветер',
                          number: '15185RI112B',
                        ),
                      ),
                    ),
                    onTariffTap: (ctx) => Navigator.of(ctx).push(
                      MaterialPageRoute(
                        builder: (context) => const TariffsScreenC(selectedTariff: 'Инвестор'),
                      ),
                    ),
                  ),
                  AccountListItem(
                    balance: '1 593 742,90 ₽',
                    changeText: '+2947,23 ₽',
                    changeColor: AppColors.textPositiveDefault,
                    number: '15185RI112B',
                    subtitle: 'Деньги на ветер',
                    isFavorite: false,
                    tariffType: TariffType.portfolio,
                    tariffTitle: 'Инвестор',
                    tariffSubtitle: 'Текущий тариф',
                    onTap: (ctx) => Navigator.of(ctx).push(
                      MaterialPageRoute(
                        builder: (context) => AccountDetailsScreen(
                          title: 'Деньги на ветер',
                          number: '15185RI112B',
                        ),
                      ),
                    ),
                    onTariffTap: (ctx) => Navigator.of(ctx).push(
                      MaterialPageRoute(
                        builder: (context) => const TariffsScreenC(selectedTariff: 'Инвестор'),
                      ),
                    ),
                  ),
                ],
                ),
              ),
              const SizedBox(height: 16),
              // Остальные элементы с отступами
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const LearningMenuCard(),
                    const SizedBox(height: 16),
                    const MenusSection(showAccountManagement: false),
                    const SizedBox(height: 16),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}