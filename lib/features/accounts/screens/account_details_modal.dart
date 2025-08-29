import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/section_label.dart';
import '../widgets/info_card.dart';
import '../widgets/status_card.dart';
import '../widgets/investor_card.dart';
import '../widgets/switch_row.dart';
import '../widgets/margin_trading_card.dart';
import '../widgets/account_sections_table.dart';
import '../widgets/iis_section.dart';
import '../../../core/widgets/screen_header.dart';

void showAccountDetailsModal(
  BuildContext context, {
  required String title,
  required String number,
  bool isIIS = false,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFFF2F4F6),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (ctx) {
      final height = MediaQuery.of(ctx).size.height * 0.95;
      return SizedBox(
        height: height,
        child: AccountDetailsSheet(title: title, number: number, isIIS: isIIS),
      );
    },
  );
}

class AccountDetailsSheet extends StatelessWidget {
  final String title;
  final String number;
  final bool isIIS;

  const AccountDetailsSheet({super.key, required this.title, required this.number, this.isIIS = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        children: [
          ScreenHeader(title: title, subtitle: number),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              children: [
                const SectionLabel('Основная информация'),
                InfoCard(rows: const [
                  InfoRow('Договор', '215/0302-1919/1 от 03 фев 2021'),
                  InfoRow('Номер счета', 'КЛФ-1235797'),
                  InfoRow('Торговый код', '316952R7JF9/316952R7JF9'),
                  InfoRow('Дата открытия', '03 фев 2021'),
                ]),
                const SizedBox(height: 16),
                const StatusCard(),
                if (isIIS) ...[
                  const SizedBox(height: 16),
                  const IISSection(),
                ],
                if (!isIIS) ...[
                  const SizedBox(height: 16),
                  const InvestorCard(),
                ],
                const SizedBox(height: 16),
                const SwitchRow(
                  title: 'Внебиржевая торговля валютой',
                  value: false,
                ),
                const SizedBox(height: 16),
                const MarginTradingCard(),
                const SizedBox(height: 16),
                const SectionLabel('Разделы счета'),
                const AccountSectionsTable(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


