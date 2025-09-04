import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/tariffs_carousel.dart';
import '../widgets/moscow_spb_table.dart';
import '../widgets/compare_tariffs_card.dart';
import '../widgets/scrollable_tabs.dart';
import '../widgets/tariff_agreements_button.dart';
import '../../../core/widgets/accordion_section.dart';
import '../../../core/theme/appcolors.dart';
import '../../../core/widgets/screen_header.dart';

class TariffsScreen extends StatelessWidget {
  const TariffsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F6),
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(title: 'Тарифы'),
            
            const SizedBox(height: 16),
            
            // Content sections below the card
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Main tariff card
                    TariffsCarousel(),
                    
                    const SizedBox(height: 24),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const TariffAgreementsButton(),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Main title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Все условия тарифа\n"Долгосрочный портфель"',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBaseDefault,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 8),
                    
                    // Description text
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Покупайте российские акции, облигации и фонды на Московской и СПБ биржах без брокерской комиссии и абонентской платы при любом обороте',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textOnLightDefault,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Segmented control (tabs)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const ScrollableTabs(),
                    ),
                    
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
  }
}
