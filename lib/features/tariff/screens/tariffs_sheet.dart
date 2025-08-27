import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/tariffs_carousel.dart';
import '../widgets/accordion_section.dart';
import '../widgets/moscow_spb_table.dart';
import '../widgets/compare_tariffs_card.dart';
import '../widgets/scrollable_tabs.dart';
import '../widgets/tariff_agreements_button.dart';
import '../../../core/theme/colors.dart';
import '../../../core/widgets/screen_header.dart';

class TariffsSheet extends StatelessWidget {
  const TariffsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        children: [
          const SizedBox(height: 8),
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.black12,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 12),
          
          ScreenHeader(title: 'Тарифы'),
          
          const SizedBox(height: 16),
          
          // Content sections below the card
          Flexible(
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
                    child: const Text(
                      'Все условия тарифа\n"Долгосрочный портфель"',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: AccordionSection(
                      title: 'Московская биржа и СПБ Биржа',
                      content: MoscowSPBTable(),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: AccordionSection(
                      title: 'Московская биржа',
                      content: MoscowSPBTable(),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: AccordionSection(
                      title: 'NYSE, NASDAQ, HKEX',
                      content: MoscowSPBTable(),
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
    );
  }
}
