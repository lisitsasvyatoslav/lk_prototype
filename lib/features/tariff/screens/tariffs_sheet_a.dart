import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../widgets/tariffs_carousel.dart';
import '../widgets/moscow_spb_table.dart';
import '../widgets/compare_tariffs_card.dart';
import '../widgets/scrollable_tabs.dart';
import '../widgets/tariff_agreements_button.dart';
import '../widgets/commissions_table.dart';
import '../../../core/widgets/accordion_section.dart';
import '../../../core/theme/appcolors.dart';
import '../../../core/widgets/screen_header.dart';
import '../../../core/providers/account_provider.dart';
import 'account_selection_modal.dart';

class TariffsScreen extends StatefulWidget {
  const TariffsScreen({super.key});

  @override
  State<TariffsScreen> createState() => _TariffsScreenState();
}

class _TariffsScreenState extends State<TariffsScreen> {
  String _currentTariffTitle = 'Долгосрочный портфель'; // Начальный тариф

  void _onTariffChanged(String tariffTitle) {
    setState(() {
      _currentTariffTitle = tariffTitle;
    });
  }

  void _showAccountSelectionModal() {
    showAccountSelectionModal(
      context,
      tariffTitle: _currentTariffTitle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountProvider>(
      builder: (context, accountProvider, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF2F4F6),
          body: SafeArea(
            child: Column(
              children: [
                ScreenHeader(
                  title: 'Тарифы',
                  subtitle: accountProvider.selectedAccountName,
                  isSubtitleClickable: true,
                  onSubtitlePressed: _showAccountSelectionModal,
                ),
                
                const SizedBox(height: 16),
                
                // Content sections below the card
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Main tariff card
                        TariffsCarousel(
                          onTariffChanged: _onTariffChanged,
                        ),
                        
                        const SizedBox(height: 24),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: const TariffAgreementsButton(),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Expandable sections
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              AccordionSection(
                                title: 'Комиссия по инструментам',
                                child: const CommissionsTable(),
                                initiallyExpanded: false,
                                contentPadding: EdgeInsets.zero,
                              ),
                              AccordionSection(
                                title: 'Стоимость обслуживания',
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: const Text(
                                    'Московская биржа и СПБ Бесплатно.\nДепозитарное обслуживание бесплатно для\nновых клиентов.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textBaseDefault,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                                initiallyExpanded: false,
                                contentPadding: EdgeInsets.zero,
                              ),
                              AccordionSection(
                                title: 'Кому подходит',
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: const Text(
                                    'Для начинающих инвесторов, формирующих\nпортфель. Инвестиции на годы, низкие комиссии.\nПокупка акций и облигаций без комиссии\nброкера.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textBaseDefault,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                                initiallyExpanded: false,
                                contentPadding: EdgeInsets.zero,
                              ),
                              AccordionSection(
                                title: 'Что входит в обслуживание/\nусловия',
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: const Text(
                                    'Доступ к МосБирже (ценные бумаги, валюта,\nдрагоценные металлы, фьючерсы),\nвнебиржевому рынку. Доступны длинные\nпозиции и пониженное ГО на срочном рынке.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textBaseDefault,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                                initiallyExpanded: false,
                                contentPadding: EdgeInsets.zero,
                              ),
                              AccordionSection(
                                title: 'Доступные инструменты/валюты',
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: const Text(
                                    'Ценные бумаги (российские и иностранные),\nвалюта, драгоценные металлы, фьючерсы,\nопционы',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textBaseDefault,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                                initiallyExpanded: false,
                                contentPadding: EdgeInsets.zero,
                              ),
                              AccordionSection(
                                title: 'Дополнительные опции',
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: const Text(
                                    'Доступные торговые платформы: FinamTrade\n(мобильное и веб), Transaq, MetaTrader, QUIK.\nБесплатное пополнение счета.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textBaseDefault,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                                initiallyExpanded: false,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Call-to-action card
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CompareTariffsCard(),
                        ),
                        
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
