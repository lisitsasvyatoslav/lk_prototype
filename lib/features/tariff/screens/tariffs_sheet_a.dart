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
  final String? selectedTariff;
  
  const TariffsScreen({super.key, this.selectedTariff});

  @override
  State<TariffsScreen> createState() => _TariffsScreenState();
}

class _TariffsScreenState extends State<TariffsScreen> {
  late String _currentTariffTitle;

  // Данные для аккордионов по тарифам
  final Map<String, Map<String, dynamic>> _accordionContent = {
    'Единый дневной': {
      'Комиссия по инструментам': [
        {
          'title': 'ЦБ Российских эмитентов',
          'items': [
            {'value': '0,0354 %', 'description': 'при обороте в день до 1 млн ₽ (мин. 41,3 ₽ за поручение)'},
          ],
        },
        {
          'title': 'Фьючерсы',
          'items': [
            {'value': '0,45 ₽', 'description': 'за контракт'},
          ],
        },
        {
          'title': 'Драгоценные металлы',
          'items': [
            {'value': '0,05 %', 'description': 'при обороте до 1000000'},
          ],
        },
        {
          'title': 'Иностранные ценные бумаги',
          'items': [
            {'value': '0,0354 %', 'description': 'при обороте в день до 1 млн ₽ (мин. 41,3 ₽ за поручение)'},
          ],
        },
        {
          'title': 'Валюта',
          'items': [
            {'value': '0,03682%', 'description': 'при обороте в день до 1 млн ₽ (мин. 41,3 ₽ за поручение)'},
          ],
        },
      ],
      'Стоимость обслуживания': '177 ₽ в месяц (400 руб. - если СЧА менее 2000 руб.). Депозитарное обслуживание бесплатно для новых клиентов',
      'Кому подходит': 'Для активных трейдеров с большим торговым оборотом',
      'Что входит в обслуживание/\nусловия': 'Доступ к МосБирже (ценные бумаги, валюта, драгоценные металлы, фьючерсы), внебиржевому рынку. Доступны длинные позиции и пониженное ГО на срочном рынке.',
      'Доступные инструменты/валюты': 'Ценные бумаги (российские и иностранные), валюта, драгоценные металлы, фьючерсы, опционы',
      'Дополнительные опции': 'Доступные торговые платформы: FinamTrade (мобильное и веб), Transaq, MetaTrader, QUIK. Бесплатное пополнение счета.',
    },
    'Инвестор': {
      'Комиссия по инструментам': [
        {
          'title': 'Московская биржа и СПБ Биржа',
          'items': [
            {'value': '0,035 %', 'description': 'при обороте в день до 1 млн ₽.'},
            {'value': '0,28 %', 'description': 'комиссия брокера за продажу'},
          ],
        },
        {
          'title': 'Фьючерсы',
          'items': [
            {'value': '0,45 ₽', 'description': 'за контракт'},
          ],
        },
        {
          'title': 'Драгоценные металлы',
          'items': [
            {'value': '0,05 %', 'description': 'при обороте до 1000000'},
          ],
        },
        {
          'title': 'Иностранные ценные бумаги',
          'items': [
            {'value': '0,035 %', 'description': 'при обороте в день до 1 млн ₽'},
          ],
        },
        {
          'title': 'Валюта',
          'items': [
            {'value': '0,03682 %', 'description': 'при обороте в день до 1 млн ₽ (мин. 41,3 ₽ за поручение)'},
          ],
        },
      ],
      'Стоимость обслуживания': '200 ₽ в месяц. Депозитарное обслуживание бесплатно для новых клиентов',
      'Кому подходит': 'Для сделок на иностранных рынках. Выгодные условия для торговли на иностранных рынках',
      'Что входит в обслуживание/\nусловия': 'Доступ к МосБирже (ценные бумаги, валюта, драгоценные металлы, фьючерсы), внебиржевому рынку. Доступны длинные позиции и пониженное ГО на срочном рынке.',
      'Доступные инструменты/валюты': 'Ценные бумаги (российские и иностранные), валюта, драгоценные металлы, фьючерсы, опционы',
      'Дополнительные опции': 'Доступные торговые платформы: FinamTrade (мобильное и веб), Transaq, MetaTrader, QUIK. Бесплатное пополнение счета.',
    },
    'Стратег': {
      'Комиссия по инструментам': [
        {
          'title': 'ЦБ Российских эмитентов',
          'items': [
            {'value': '0,05%, мин. 50 ₽', 'description': 'за исполненное поручение.'},
          ],
        },
        {
          'title': 'Фьючерсы',
          'items': [
            {'value': '0,9 ₽', 'description': 'за контракт'},
          ],
        },
        {
          'title': 'Драгоценные металлы',
          'items': [
            {'value': '0,3 %', 'description': 'не включая оборот по сделкам своп'},
          ],
        },
        {
          'title': 'Иностранные ценные бумаги',
          'items': [
            {'value': '0,05%, мин. 50 ₽', 'description': 'за исполненное поручение.'},
          ],
        },
        {
          'title': 'Валюта',
          'items': [
            {'value': '0,03682%', 'description': 'при обороте в день до 1 млн ₽ (мин. 41,3 ₽ за поручение)'},
          ],
        },
      ],
      'Стоимость обслуживания': 'Бесплатно. Депозитарное обслуживание бесплатно для новых клиентов',
      'Кому подходит': 'Для долгосрочной стратегии, для редких сделок. Если редко инвестируете и планируете держать приобретённые активы',
      'Что входит в обслуживание/\nусловия': 'Доступ к МосБирже (ценные бумаги, валюта, драгоценные металлы, фьючерсы), внебиржевому рынку. Доступны длинные позиции и пониженное ГО на срочном рынке.',
      'Доступные инструменты/валюты': 'Ценные бумаги (российские и иностранные), валюта, драгоценные металлы, фьючерсы, опционы',
      'Дополнительные опции': 'Доступные торговые платформы: FinamTrade (мобильное и веб), Transaq, MetaTrader, QUIK. Бесплатное пополнение счета.',
    },
    'Единый Консультационный': {
      'Комиссия по инструментам': [
        {
          'title': 'ЦБ Российских эмитентов',
          'items': [
            {'value': '0,108324%', 'description': 'при обороте в день до 10 млн ₽'},
          ],
        },
        {
          'title': 'Фьючерсы',
          'items': [
            {'value': '4,65 ₽', 'description': 'за контракт'},
          ],
        },
        {
          'title': 'Драгоценные металлы',
          'items': [
            {'value': '0,3%', 'description': 'не включая оборот по сделкам своп'},
          ],
        },
        {
          'title': 'Иностранные ценные бумаги',
          'items': [
            {'value': '0,108324%', 'description': 'при обороте в день до 10 млн ₽'},
          ],
        },
        {
          'title': 'Валюта',
          'items': [
            {'value': '0,08262%', 'description': ''},
          ],
        },
      ],
      'Стоимость обслуживания': '177 ₽ в месяц (400 руб. - если СЧА менее 2000 руб.). Депозитарное обслуживание бесплатно для новых клиентов',
      'Кому подходит': 'Для тех, кто хочет получать инвестиционные идеи, аналитику и консультационную поддержку от профессиональных трейдеров Финама',
      'Что входит в обслуживание/\nусловия': 'Доступ к МосБирже (ценные бумаги, валюта, драгоценные металлы, фьючерсы), внебиржевому рынку. Доступны длинные позиции и пониженное ГО на срочном рынке.',
      'Доступные инструменты/валюты': 'Ценные бумаги (российские и иностранные), валюта, драгоценные металлы, фьючерсы, опционы',
      'Дополнительные опции': 'Доступные торговые платформы: FinamTrade (мобильное и веб), Transaq, MetaTrader, QUIK. Бесплатное пополнение счета.',
    },
    'Долгосрочный портфель': {
      'Комиссия по инструментам': [
        {
          'title': 'ЦБ Российских эмитентов',
          'items': [
            {'value': '0 %', 'description': 'комиссия брокера за покупку'},
            {'value': '0,28 %', 'description': 'комиссия брокера за продажу'},
          ],
        },
        {
          'title': 'Фьючерсы',
          'items': [
            {'value': '0,45 ₽', 'description': 'за контракт'},
          ],
        },
        {
          'title': 'Драгоценные металлы',
          'items': [
            {'value': '0,3 %', 'description': 'не включая оборот по сделкам своп'},
          ],
        },
        {
          'title': 'Иностранные ценные бумаги',
          'items': [
            {'value': '0 %', 'description': 'комиссия брокера за покупку'},
            {'value': '0,28 %', 'description': 'комиссия брокера за продажу'},
          ],
        },
        {
          'title': 'Валюта',
          'items': [
            {'value': '0,03682%', 'description': 'при обороте в день до млн ₽ (мин. 41,3 ₽ за поручение)'},
          ],
        },
      ],
      'Стоимость обслуживания': 'Московская биржа и СПБ Бесплатно. Депозитарное обслуживание бесплатно для новых клиентов',
      'Кому подходит': 'Для начинающих инвесторов, формирующих портфель. Инвестиции на годы, низкие комиссии. Покупка акции и облигации без комиссии брокера',
      'Что входит в обслуживание/\nусловия': 'Доступ к МосБирже (ценные бумаги, валюта, драгоценные металлы, фьючерсы), внебиржевому рынку. Доступны длинные позиции и пониженное ГО на срочном рынке',
      'Доступные инструменты/валюты': 'Ценные бумаги (российские и иностранные), валюта, драгоценные металлы, фьючерсы, опционы',
      'Дополнительные опции': 'Доступные торговые платформы: FinamTrade (мобильное и веб), Transaq, MetaTrader, QUIK. Бесплатное пополнение счета.',
    },
    // Для остальных тарифов используем дефолтный контент
    'default': {
      'Стоимость обслуживания': 'Московская биржа и СПБ Бесплатно.\nДепозитарное обслуживание бесплатно для\nновых клиентов.',
      'Кому подходит': 'Для начинающих инвесторов, формирующих\nпортфель. Инвестиции на годы, низкие комиссии.\nПокупка акций и облигаций без комиссии\nброкера.',
      'Что входит в обслуживание/\nусловия': 'Доступ к МосБирже (ценные бумаги, валюта,\nдрагоценные металлы, фьючерсы),\nвнебиржевому рынку. Доступны длинные\nпозиции и пониженное ГО на срочном рынке.',
      'Доступные инструменты/валюты': 'Ценные бумаги (российские и иностранные),\nвалюта, драгоценные металлы, фьючерсы,\nопционы',
      'Дополнительные опции': 'Доступные торговые платформы: FinamTrade\n(мобильное и веб), Transaq, MetaTrader, QUIK.\nБесплатное пополнение счета.',
    },
  };

  @override
  void initState() {
    super.initState();
    _currentTariffTitle = widget.selectedTariff ?? 'Долгосрочный портфель';
  }

  void _onTariffChanged(String tariffTitle) {
    setState(() {
      _currentTariffTitle = tariffTitle;
    });
  }

  dynamic _getAccordionContent(String accordionTitle) {
    final tariffContent = _accordionContent[_currentTariffTitle] ?? _accordionContent['default']!;
    return tariffContent[accordionTitle] ?? '';
  }

  void _showAccountSelectionModal() {
    // Определяем, является ли текущий тариф персональным
    // Для примера считаем "Долгосрочный портфель" персональным тарифом
    bool isPersonalTariff = _currentTariffTitle == 'Долгосрочный портфель';
    
    showAccountSelectionModal(
      context,
      tariffTitle: _currentTariffTitle,
      isPersonalTariff: isPersonalTariff,
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
                          initialTariff: _currentTariffTitle,
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
                                child: CommissionsTable(
                                  commissionData: _getAccordionContent('Комиссия по инструментам') is List 
                                    ? _getAccordionContent('Комиссия по инструментам') as List<Map<String, dynamic>>
                                    : null,
                                ),
                                initiallyExpanded: false,
                                contentPadding: EdgeInsets.zero,
                              ),
                              AccordionSection(
                                title: 'Стоимость обслуживания',
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    _getAccordionContent('Стоимость обслуживания').toString(),
                                    style: const TextStyle(
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
                                  child: Text(
                                    _getAccordionContent('Кому подходит').toString(),
                                    style: const TextStyle(
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
                                  child: Text(
                                    _getAccordionContent('Что входит в обслуживание/\nусловия').toString(),
                                    style: const TextStyle(
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
                                  child: Text(
                                    _getAccordionContent('Доступные инструменты/валюты').toString(),
                                    style: const TextStyle(
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
                                  child: Text(
                                    _getAccordionContent('Дополнительные опции').toString(),
                                    style: const TextStyle(
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
