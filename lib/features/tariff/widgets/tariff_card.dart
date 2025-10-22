import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../screens/tariff_change_modal.dart';
import '../screens/account_selection_modal.dart';
import '../../../core/theme/appcolors.dart';
import '../../../core/providers/tariff_provider.dart';
import 'tariff_details_modal.dart';
import 'tariff_agreements_button.dart';

class TariffCharacteristic {
  final String name;
  final String value;

  const TariffCharacteristic({
    required this.name,
    required this.value,
  });
}

class TariffCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String price;
  final String priceDetail;
  final Widget icon;
  final String buttonText;
  final bool isPersonalTariff;
  final Color? iconBackgroundColor;
  final double? iconSize;
  final List<TariffCharacteristic> characteristics;
  final String? iconPath;

  const TariffCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.price,
    required this.priceDetail,
    required this.icon,
    required this.buttonText,
    this.isPersonalTariff = false,
    this.iconBackgroundColor,
    this.iconSize,
    this.characteristics = const [],
    this.iconPath,
  });

  List<TariffDetailSection> _getTariffDetails() {
    switch (title) {
      case 'Долгосрочный портфель':
        return [
          TariffDetailSection(
            title: 'Инструменты',
            items: [
              TariffDetailItem(
                label: 'Ценные бумаги, валюта и драгоценные металлы, фьючерсы, внебиржевой рынок',
                value: '',
              ),
            ],
          ),
          TariffDetailSection(
            title: 'Комиссии',
            groups: [
              TariffDetailGroup(
                title: 'ЦБ Российских эмитентов',
                items: [
                  TariffDetailItem(
                    label: 'Комиссия брокера за покупку',
                    value: '0 %',
                  ),
                  TariffDetailItem(
                    label: 'Комиссия брокера за продажу',
                    value: '0,28 %',
                  ),
                ],
              ),
            ],
            items: [
              TariffDetailItem(
                label: 'Фьючерсы',
                subLabel: 'За контракт',
                value: '0,45 ₽',
              ),
              TariffDetailItem(
                label: 'Драгоценные металлы',
                subLabel: 'Не включая оборот по сделкам своп',
                value: '0,3 %',
              ),
              TariffDetailItem(
                label: 'Иностранные ценные бумаги',
                subLabel: 'Комиссия брокера за покупку ценных бумаг (за исключением облигаций)',
                value: '0,1%',
              ),
              TariffDetailItem(
                label: 'Валюта',
                subLabel: 'При обороте в день до млн ₽ (мин. 41,3 ₽ за поручение)',
                value: '0,03682%',
              ),
              TariffDetailItem(
                label: 'Биржи',
                subLabel: 'Мосбиржа, СПБ биржа, NYSE, NASDAQ, HKEX, SSE, SZSE',
                value: '',
              ),
            ],
          ),
        ];
      case 'Единый дневной':
        return [
          TariffDetailSection(
            title: 'Инструменты',
            items: [
              TariffDetailItem(
                label: 'Ценные бумаги, валюта и драгоценные металлы, фьючерсы, внебиржевой рынок',
                value: '',
              ),
            ],
          ),
          TariffDetailSection(
            title: 'Комиссии',
            groups: [
              TariffDetailGroup(
                title: 'ЦБ Российских эмитентов',
                items: [
                  TariffDetailItem(
                    label: 'Комиссия брокера за покупку',
                    value: '0 %',
                  ),
                  TariffDetailItem(
                    label: 'Комиссия брокера за продажу',
                    value: '0,28 %',
                  ),
                ],
              ),
            ],
            items: [
              TariffDetailItem(
                label: 'Фьючерсы',
                subLabel: 'За контракт',
                value: '0,45 ₽',
              ),
              TariffDetailItem(
                label: 'Драгоценные металлы',
                subLabel: 'Не включая оборот по сделкам своп',
                value: '0,3 %',
              ),
              TariffDetailItem(
                label: 'Иностранные ценные бумаги',
                subLabel: 'Комиссия брокера за покупку ценных бумаг (за исключением облигаций)',
                value: '0,1 %',
              ),
              TariffDetailItem(
                label: 'Валюта',
                subLabel: 'При обороте в день до 1 млн ₽ (мин. 41,3 ₽ за поручение)',
                value: '0,03682%',
              ),
              TariffDetailItem(
                label: 'Биржи',
                subLabel: 'Мосбиржа, СПБ биржа, NYSE, NASDAQ, HKEX, SSE, SZSE',
                value: '',
              ),
            ],
          ),
        ];
      case 'Инвестор':
        return [
          TariffDetailSection(
            title: 'Инструменты',
            items: [
              TariffDetailItem(
                label: 'Ценные бумаги, валюта и драгоценные металлы, фьючерсы, внебиржевой рынок',
                value: '',
              ),
            ],
          ),
          TariffDetailSection(
            title: 'Комиссии',
            groups: [
              TariffDetailGroup(
                title: 'Московская биржа и СПБ Биржа',
                items: [
                  TariffDetailItem(
                    label: 'При обороте в день до 1 млн ₽.',
                    value: '0,035%',
                  ),
                  TariffDetailItem(
                    label: 'Комиссия брокера за продажу',
                    value: '0,28 %',
                  ),
                ],
              ),
            ],
            items: [
              TariffDetailItem(
                label: 'Фьючерсы',
                subLabel: 'За контракт',
                value: '0,45₽',
              ),
              TariffDetailItem(
                label: 'Драгоценные металлы',
                subLabel: 'Не включая оборот по сделкам своп',
                value: '0,05%',
              ),
              TariffDetailItem(
                label: 'Иностранные ценные бумаги',
                subLabel: 'Комиссия брокера за покупку ценных бумаг (за исключением облигаций)',
                value: '0,035%',
              ),
              TariffDetailItem(
                label: 'Валюта',
                subLabel: 'При обороте в день до 1 млн ₽ (мин. 41,3 ₽ за поручение)',
                value: '0,03682%',
              ),
              TariffDetailItem(
                label: 'Биржи',
                subLabel: 'Мосбиржа, СПБ биржа, NYSE, NASDAQ, HKEX, SSE, SZSE',
                value: '',
              ),
            ],
          ),
        ];
      case 'Стратег':
        return [
          TariffDetailSection(
            title: 'Инструменты',
            items: [
              TariffDetailItem(
                label: 'Ценные бумаги, валюта и драгоценные металлы, фьючерсы, внебиржевой рынок',
                value: '',
              ),
            ],
          ),
          TariffDetailSection(
            title: 'Комиссии',
            groups: [
              TariffDetailGroup(
                title: 'ЦБ Российских эмитентов',
                items: [
                  TariffDetailItem(
                    label: 'За исполненное поручение',
                    value: '0,05 (мин. 50₽)',
                  ),
                ],
              ),
            ],
            items: [
              TariffDetailItem(
                label: 'Фьючерсы',
                subLabel: 'За контракт',
                value: '0,9₽',
              ),
              TariffDetailItem(
                label: 'Драгоценные металлы',
                subLabel: 'Не включая оборот по сделкам своп',
                value: '0,3%',
              ),
              TariffDetailItem(
                label: 'Иностранные ценные бумаги',
                subLabel: 'Комиссия брокера за покупку ценных бумаг (за исключением облигаций)',
                value: '0,05% (мин. 50₽)',
              ),
              TariffDetailItem(
                label: 'Валюта',
                subLabel: 'При обороте в день до 1 млн ₽ (мин. 41,3 ₽ за поручение)',
                value: '0,03682%',
              ),
              TariffDetailItem(
                label: 'Биржи',
                subLabel: 'Мосбиржа, СПБ биржа, NYSE, NASDAQ, HKEX, SSE, SZSE',
                value: '',
              ),
            ],
          ),
        ];
      case 'Единый Консультационный':
        return [
          TariffDetailSection(
            title: 'Инструменты',
            items: [
              TariffDetailItem(
                label: 'Ценные бумаги, валюта и драгоценные металлы, фьючерсы, внебиржевой рынок',
                value: '',
              ),
            ],
          ),
          TariffDetailSection(
            title: 'Комиссии',
            groups: [
              TariffDetailGroup(
                title: 'ЦБ Российских эмитентов',
                items: [
                  TariffDetailItem(
                    label: 'При обороте в день до 10 млн ₽',
                    value: '0,108324%',
                  ),
                ],
              ),
            ],
            items: [
              TariffDetailItem(
                label: 'Фьючерсы',
                subLabel: 'За контракт',
                value: '4,65₽',
              ),
              TariffDetailItem(
                label: 'Драгоценные металлы',
                subLabel: 'Не включая оборот по сделкам своп',
                value: '0,3%',
              ),
              TariffDetailItem(
                label: 'Иностранные ценные бумаги',
                subLabel: 'Комиссия брокера за покупку ценных бумаг (за исключением облигаций)',
                value: '0,108324%',
              ),
              TariffDetailItem(
                label: 'Валюта',
                subLabel: 'При обороте в день до 1 млн ₽ (мин. 41,3 ₽ за поручение)',
                value: '0,08262%',
              ),
              TariffDetailItem(
                label: 'Биржи',
                subLabel: 'Мосбиржа, СПБ биржа, NYSE, NASDAQ, HKEX, SSE, SZSE',
                value: '',
              ),
            ],
          ),
        ];
      default:
        return [
          TariffDetailSection(
            title: 'Инструменты',
            items: [
              TariffDetailItem(
                label: 'Ценные бумаги, валюта и драгоценные металлы, фьючерсы, внебиржевой рынок',
                value: '',
              ),
            ],
          ),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TariffProvider>(
      builder: (context, tariffProvider, child) {
        final isConnected = tariffProvider.isTariffConnected(title);
        
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color(0x11000000),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            // Иконка
            Center(
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: iconBackgroundColor ?? const Color(0xFFF9F9F9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: icon,
                ),
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Заголовок
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBaseDefault,
                ),
              ),
            ),
            
            const SizedBox(height: 8),
            
            // Описание
            Center(
              child: Text(
                description,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textOnLightDefault,
                  height: 1.3,
                ),
              ),
            ),
            
            const SizedBox(height: 8),
            
            // Цена
            Center(
              child: Text(
                price,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: price == 'Бесплатно' 
                    ? AppColors.textPositiveDefault 
                    : AppColors.textOnBrandDefault,
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Кнопка "Соглашения по тарифу" для подключенных тарифов
            if (isConnected) ...[
              const TariffAgreementsButton(),
              const SizedBox(height: 16),
            ],
            
            // Характеристики тарифа
            if (characteristics.isNotEmpty) ...[
              Column(
                children: characteristics.asMap().entries.map((entry) {
                  final index = entry.key;
                  final characteristic = entry.value;
                  final isLast = index == characteristics.length - 1;
                  
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      border: isLast ? null : const Border(
                        bottom: BorderSide(
                          color: Color(0xFFE5E5E7),
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          characteristic.name,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textBaseSecondary,
                          ),
                        ),
                        Text(
                          characteristic.value,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textBaseDefault,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              
              const SizedBox(height: 16),
            ],
            
            // Spacer для прижатия кнопок к низу
            const Spacer(),
            
            // Кнопки
            Column(
              children: [
                // Кнопка "Подробнее о тарифе"
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      showTariffDetailsModal(
                        context,
                        tariffTitle: title,
                        tariffDescription: description,
                        sections: _getTariffDetails(),
                        isConnected: isConnected,
                        onConnectTariff: () {
                          Navigator.of(context).pop(); // Закрываем модальное окно
                          showAccountSelectionModal(
                            context, 
                            tariffTitle: title,
                            isPersonalTariff: isPersonalTariff,
                            tariffPrice: price,
                            tariffIcon: iconPath,
                            tariffIconSize: iconSize,
                            tariffIconBackgroundColor: iconBackgroundColor,
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: AppColors.buttonLabelSecondary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                          color: AppColors.buttonBorderOutlineDefault,
                          width: 1,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Подробнее о тарифе',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 12),
                
                // Кнопка "Подключить" или статус "Подключен"
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: isConnected
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/check.svg',
                                width: 16,
                                height: 16,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.buttonLabelGhost,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Подключен',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.buttonLabelGhost,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () => showAccountSelectionModal(
                          context, 
                          tariffTitle: title,
                          isPersonalTariff: isPersonalTariff,
                          tariffPrice: price,
                          tariffIcon: iconPath,
                          tariffIconSize: iconSize,
                          tariffIconBackgroundColor: iconBackgroundColor,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonBgPrimaryDefault,
                          foregroundColor: const Color(0xFF000000),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          buttonText,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                ),
              ],
            ),
              ],
            ),
          ),
        );
      },
    );
  }
}
