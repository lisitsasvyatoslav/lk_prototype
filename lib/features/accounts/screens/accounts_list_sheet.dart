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
            // Фиксированная шапка аккордиона "Брокерские счета"
            Container(
              color: const Color(0xFFF2F4F6),
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: InkWell(
                onTap: () {
                  // Здесь можно добавить логику для переключения состояния аккордиона
                },
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Брокерские счета',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textBaseDefault,
                          ),
                        ),
                      ),
                      Icon(
                        CupertinoIcons.chevron_down,
                        color: AppColors.iconBaseTertiary,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Прокручиваемый контент
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  // Контент аккордиона "Брокерские счета"
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: AccountsCard(),
                  ),
                  // Аккордеон "ИИС"
                  AccordionSection(
                    title: 'ИИС',
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


