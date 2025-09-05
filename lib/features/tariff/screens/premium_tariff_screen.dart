import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/moscow_spb_table.dart';
import '../widgets/scrollable_tabs.dart';
import '../widgets/tariff_agreements_button.dart';
import '../../../core/widgets/accordion_section.dart';
import '../../../core/theme/appcolors.dart';
import '../../../core/widgets/screen_header.dart';
import 'tariffs_sheet.dart';

class PremiumTariffScreen extends StatelessWidget {
  const PremiumTariffScreen({super.key});

  Widget _buildPremiumIcon() {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        gradient: const RadialGradient(
          center: Alignment.center,
          radius: 1,
          stops: [0.0, 0.6, 1.0],
          colors: [
            Color(0xFFFFFFFF), // Белый центр
            Color(0xFFFFFFFF), // Очень светло-серый
            Color(0xFFFFFFFF), // Светло-серый по краям
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: Color(0xFFE5E7EB),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.transparent,
              Color(0xFFEDEDED),
            ],
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/diamond.svg',
            width: 38.2,
            height: 33.42,
            colorFilter: const ColorFilter.mode(AppColors.bgBrandInverseHover, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F6),
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(title: 'Тариф Премиум'),
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Subtitle
                    Text(
                      'У вас персональный Премиум тариф',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textBaseSecondary,
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    // Premium icon
                    Center(
                      child: _buildPremiumIcon(),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Description
                    Text(
                      'При расчете вознаграждения Брокера по сделкам с ценными бумагами на фондовом рынке ПАО Московская Биржа оборот по клиентскому счету определяется за календарный день (а не за торговую сессию).',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textBaseDefault,
                        height: 1.4,
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Tariff agreement button
                    const TariffAgreementsButton(),
                    
                    const SizedBox(height: 24),
                    
                    // Tariff details
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          ..._getPremiumServices().map((service) => Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      service['name']!,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textBaseSecondary,
                                      ),
                                    ),
                                    Text(
                                      service['fee']!,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textBaseDefault,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(height: 24, color: AppColors.borderBaseTertiary),
                            ],
                          )),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Segmented control (tabs)
                    const ScrollableTabs(),
                    
                    const SizedBox(height: 16),
                    
                    // Expandable sections
                    AccordionSection(
                      title: 'Московская биржа и СПБ Биржа',
                      child: MoscowSPBTable(),
                      initiallyExpanded: false,
                    ),
                    
                    AccordionSection(
                      title: 'Московская биржа',
                      child: MoscowSPBTable(),
                      initiallyExpanded: false,
                    ),
                    
                    AccordionSection(
                      title: 'NYSE, NASDAQ, HKEX',
                      child: MoscowSPBTable(),
                      initiallyExpanded: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonBgSecondaryDefault,
                foregroundColor: AppColors.buttonLabelSecondary,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TariffsScreen(),
                  ),
                );
              },
              child: const Text(
                'Выбрать другой тариф',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Map<String, String>> _getPremiumServices() {
    return [
      {'name': 'Ценные бумаги РФ', 'fee': 'до 0,0354%'},
      {'name': 'NASDAQ, HKEX, NYSE', 'fee': 'от 0,06%'},
      {'name': 'Фьючерсы и опционы РФ', 'fee': '0,45 ₽'},
    ];
  }
}

