import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/index.dart';
import '../../../core/theme/appcolors.dart';
import '../widgets/account_chart_card.dart';
import '../../accounts/widgets/account_list_item.dart';
import '../../accounts/screens/account_details_modal.dart';
import '../../tariff/screens/tariffs_sheet.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
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
          AccountCarousel(
            cards: [
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
                onTariffTap: (ctx) => Navigator.of(ctx).push(
                  MaterialPageRoute(
                    builder: (context) => const TariffsScreen(),
                  ),
                ),
              ),
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
          ),
          const SizedBox(height: 16),
          const LearningMenuCard(),
          const SizedBox(height: 16),
          const MenusSection(),
        ],
      ),
    );
  }
}
