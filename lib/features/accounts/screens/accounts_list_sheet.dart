import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/accounts_card.dart';
import '../widgets/invest_accounts_card.dart';
import '../../../core/widgets/accordion_section.dart';
import '../../../core/widgets/screen_header.dart';
import '../../../core/theme/appcolors.dart';

class AccountsListScreen extends StatelessWidget {
  const AccountsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F6),
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(title: 'Счета'),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                children: [
                  // Аккордеон "Брокерские счета"
                  AccordionSection(
                    title: 'Брокерские счета',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: AccountsCard(),
                    ),
                    initiallyExpanded: true,
                  ),
                  // Аккордеон "ИИС"
                  AccordionSection(
                    title: 'ИИС',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: InvestAccountsCard(),
                    ),
                    initiallyExpanded: true,
                  ),
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
                      backgroundColor: AppColors.buttonBgPrimaryDefault,
                      foregroundColor: AppColors.buttonLabelPrimary,
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
      ),
    );
  }
}


