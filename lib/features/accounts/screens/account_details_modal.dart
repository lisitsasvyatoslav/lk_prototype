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
import '../data/accounts_data.dart';
import '../../tariff/screens/tariff_change_screen.dart';

class AccountDetailsScreen extends StatelessWidget {
  final String title;
  final String number;
  final bool isIIS;

  const AccountDetailsScreen({super.key, required this.title, required this.number, this.isIIS = false});

  // Map тарифов с их иконками и цветами (дублируем из tariff_change_screen.dart)
  Map<String, Map<String, dynamic>> _getTariffConfig() {
    return {
      'Стратег': {
        'icon': 'assets/icons/rocket.24.svg',
        'iconSize': 20.5,
        'backgroundColor': const Color(0x1A93C7FF), // #93C7FF 10%
      },
      'Единый дневной': {
        'icon': 'assets/icons/daily_tariff.svg',
        'iconSize': 20.5,
        'backgroundColor': const Color(0x1AFFB23F), // #FFB23F 10%
      },
      'Долгосрочный портфель': {
        'icon': 'assets/icons/wallet_transfer_send.svg',
        'iconSize': 20.5,
        'backgroundColor': const Color(0x1A6FFF22), // #6FFF22 10%
      },
      'Инвестор': {
        'icon': 'assets/icons/chart_forest.svg',
        'iconSize': 20.5,
        'backgroundColor': const Color(0x1AFF91C1), // #FF91C1 10%
      },
      'Единый Консультационный': {
        'icon': 'assets/icons/bubble.chart.24.svg',
        'iconSize': 20.5,
        'backgroundColor': const Color(0x1AFF7A7C), // #FF7A7C 10%
      },
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F6),
      body: SafeArea(
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
                    Builder(
                      builder: (context) {
                        // Находим счет по номеру
                        final account = AccountsDataSource.accounts.firstWhere(
                          (acc) => acc.number == number,
                          orElse: () => AccountsDataSource.accounts.first,
                        );
                        
                        final tariffConfig = _getTariffConfig();
                        final tariffInfo = tariffConfig[account.tariffTitle] ?? {
                          'icon': 'assets/icons/chart_forest.svg',
                          'iconSize': 20.5,
                          'backgroundColor': const Color(0xFFF9F9F9),
                        };

                        return InvestorCard(
                          tariffTitle: account.tariffTitle,
                          tariffSubtitle: account.tariffSubtitle,
                          tariffIcon: tariffInfo['icon'],
                          tariffIconSize: tariffInfo['iconSize'],
                          tariffGradient: [
                            tariffInfo['backgroundColor'] as Color,
                            tariffInfo['backgroundColor'] as Color,
                          ],
                        );
                      },
                    ),
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
      ),
    );
  }
}


