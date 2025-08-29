import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/section_title.dart';
import '../widgets/accounts_card.dart';
import '../widgets/invest_accounts_card.dart';
import '../../../core/widgets/screen_header.dart';
import '../../../core/theme/appcolors.dart';

class AccountsListSheet extends StatelessWidget {
  const AccountsListSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        children: [
          ScreenHeader(title: 'Счета'),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              children: const [
                SectionTitle('Брокерские счета'),
                AccountsCard(),
                const SizedBox(height: 16),
                SectionTitle('Инвестиционные счета'),
                InvestAccountsCard(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SafeArea(
              top: false,
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC858),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Открыть счет',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: AppColors.buttonLabelPrimary),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


