import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/index.dart';
import '../../../core/theme/appcolors.dart';
import '../widgets/account_chart_card.dart';
import '../../accounts/widgets/account_list_item.dart';
import '../../accounts/screens/account_details_modal.dart';
import '../../tariff/screens/tariffs_sheet_c.dart';
import '../../tariff/screens/premium_tariff_screen.dart';
import '../../accounts/screens/test_list.dart';

class ProfileScreenB extends StatelessWidget {
  const ProfileScreenB({super.key});

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
