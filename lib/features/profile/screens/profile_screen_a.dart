import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/index.dart';
import '../../../core/theme/appcolors.dart';
import '../widgets/account_chart_card.dart';
import '../../accounts/widgets/account_list_item.dart';
import '../../accounts/screens/account_details_modal.dart';
import '../../tariff/screens/tariffs_sheet_a.dart';
import '../../tariff/screens/premium_tariff_screen.dart';
import '../../accounts/screens/test_list.dart';

class ProfileScreenA extends StatelessWidget {
  const ProfileScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBaseTertiary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: SingleChildScrollView(
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
                    AccountListItem(
                      balance: '2 100 000,00 ₽',
                      changeText: '+15 000,00 ₽',
                      changeColor: AppColors.textPositiveDefault,
                      number: '15185RI113C',
                      subtitle: 'Инвестиционный',
                      tariffType: TariffType.premium,
                      tariffTitle: 'Премиум',
                      tariffSubtitle: 'Текущий тариф',
                      onTap: (ctx) => Navigator.of(ctx).push(
                        MaterialPageRoute(
                          builder: (context) => AccountDetailsScreen(
                            title: 'Инвестиционный',
                            number: '15185RI113C',
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
                    AccountListItem(
                      balance: '750 000,00 ₽',
                      changeText: '−5 000,00 ₽',
                      changeColor: AppColors.textNegativeDefault,
                      number: '15185RI114D',
                      subtitle: 'Сберегательный',
                      tariffType: TariffType.portfolio,
                      tariffTitle: 'Долгосрочный портфель',
                      tariffSubtitle: 'Текущий тариф',
                      onTap: (ctx) => Navigator.of(ctx).push(
                        MaterialPageRoute(
                          builder: (context) => AccountDetailsScreen(
                            title: 'Сберегательный',
                            number: '15185RI114D',
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
                      balance: '3 250 000,00 ₽',
                      changeText: '+25 000,00 ₽',
                      changeColor: AppColors.textPositiveDefault,
                      number: '15185RI115E',
                      subtitle: 'VIP Портфель',
                      tariffType: TariffType.premium,
                      tariffTitle: 'Премиум',
                      tariffSubtitle: 'Текущий тариф',
                      onTap: (ctx) => Navigator.of(ctx).push(
                        MaterialPageRoute(
                          builder: (context) => AccountDetailsScreen(
                            title: 'VIP Портфель',
                            number: '15185RI115E',
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
                    AccountListItem(
                      balance: '890 000,00 ₽',
                      changeText: '−12 500,00 ₽',
                      changeColor: AppColors.textNegativeDefault,
                      number: '15185RI116F',
                      subtitle: 'Консервативный',
                      tariffType: TariffType.portfolio,
                      tariffTitle: 'Долгосрочный портфель',
                      tariffSubtitle: 'Текущий тариф',
                      onTap: (ctx) => Navigator.of(ctx).push(
                        MaterialPageRoute(
                          builder: (context) => AccountDetailsScreen(
                            title: 'Консервативный',
                            number: '15185RI116F',
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
                      balance: '1 500 000,00 ₽',
                      changeText: '+8 750,00 ₽',
                      changeColor: AppColors.textPositiveDefault,
                      number: '15185RI117G',
                      subtitle: 'Агрессивный',
                      tariffType: TariffType.premium,
                      tariffTitle: 'Премиум',
                      tariffSubtitle: 'Текущий тариф',
                      onTap: (ctx) => Navigator.of(ctx).push(
                        MaterialPageRoute(
                          builder: (context) => AccountDetailsScreen(
                            title: 'Агрессивный',
                            number: '15185RI117G',
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
                  ],
                ),
                const SizedBox(height: 16),
                const LearningMenuCard(),
                const SizedBox(height: 16),
                const MenusSection(),
                const SizedBox(height: 16),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
