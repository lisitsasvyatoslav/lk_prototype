import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/index.dart';
import '../../../core/theme/appcolors.dart';
import '../../../core/widgets/bottom_nav_bar.dart';
import '../widgets/account_chart_card.dart';
import '../../accounts/widgets/account_list_item.dart';
import '../../accounts/widgets/tariff_section.dart';
import '../../accounts/screens/account_details_modal.dart';
import '../../tariff/screens/tariffs_sheet_c.dart';
import '../../tariff/screens/premium_tariff_screen.dart';
import '../../accounts/screens/test_list.dart';
import '../../accounts/data/accounts_data.dart';

class ProfileScreenA extends StatelessWidget {
  const ProfileScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBaseTertiary,
      bottomNavigationBar: const BottomNavBar(currentIndex: 4),
      body: SafeArea(
        bottom: false,
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
                  cards: AccountsDataSource.getAllAccounts().map((accountData) {
                    return AccountListItem(
                      balance: accountData.balance,
                      changeText: accountData.changeText,
                      changeColor: accountData.changeColor,
                      number: accountData.number,
                      subtitle: accountData.subtitle,
                      isFavorite: accountData.isFavorite,
                      tariffType: accountData.tariffType,
                      tariffTitle: accountData.tariffTitle,
                      tariffSubtitle: accountData.tariffSubtitle,
                      showIISIcon: accountData.showIISIcon,
                      onTap: (ctx) => Navigator.of(ctx).push(
                        MaterialPageRoute(
                          builder: (context) => AccountDetailsScreen(
                            title: accountData.name,
                            number: accountData.number,
                            isIIS: accountData.showIISIcon,
                          ),
                        ),
                      ),
                      onTariffTap: (ctx) => Navigator.of(ctx).push(
                        MaterialPageRoute(
                          builder: (context) => TariffsScreenC(selectedTariff: accountData.tariffTitle),
                        ),
                      ),
                    );
                  }).toList(),
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