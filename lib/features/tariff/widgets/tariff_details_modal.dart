import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/appcolors.dart';
import 'tariff_agreements_button.dart';

class TariffDetailsModal extends StatelessWidget {
  final String tariffTitle;
  final String tariffDescription;
  final List<TariffDetailSection> sections;
  final VoidCallback? onConnectTariff;
  final bool isConnected;

  const TariffDetailsModal({
    super.key,
    required this.tariffTitle,
    required this.tariffDescription,
    required this.sections,
    this.onConnectTariff,
    this.isConnected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFE5E5E7),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          // Header
          Container(
            height: 72,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Stack(
              children: [
                // Centered title
                Center(
                  child: Text(
                    tariffTitle,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBaseDefault,
                    ),
                  ),
                ),
                // Close button positioned absolutely
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF2F2F7),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 16,
                          color: AppColors.textBaseDefault,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sections
                  ...sections.map((section) => _buildSection(section)),
                  
                  const SizedBox(height: 8),
                  
                  // Trading platforms section
                  _buildTradingPlatformsSection(),
                  
                  // Connected tariff info section
                  if (isConnected) ...[
                    const SizedBox(height: 16),
                    _buildConnectedTariffInfoSection(),
                  ],
                  
                  
                  // Footer buttons
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _launchTariffUrl,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: AppColors.buttonLabelGhost,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Полное описание тарифа',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      
                  const SizedBox(height: 16),
                ],
              ),
                ],
              ),
            ),
          ),
          
          // Fixed bottom section with fade and button
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                // Fade gradient
                // Container(
                //   width: double.infinity,
                //   height: 24,
                //   decoration: const BoxDecoration(
                //     gradient: LinearGradient(
                //       begin: Alignment.bottomCenter,
                //       end: Alignment.topCenter,
                //       colors: [
                //         Color(0xFFFAFAFC), // #FAFAFC 100%
                //         Color(0x00FAFAFC), // #FAFAFC 0%
                //       ],
                //     ),
                //   ),
                // ),
                
                // Fixed button section
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: SafeArea(
                    child: isConnected
                      ? const TariffAgreementsButton(showBorder: true)
                      : SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: onConnectTariff,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.buttonBgPrimaryDefault,
                              foregroundColor: const Color(0xFF000000),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Подключить тариф',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _shouldUseLargeText(String label) {
    const largeTextLabels = [
      'ЦБ Российских эмитентов',
      'Фьючерсы',
      'Драгоценные металлы',
      'Иностранные ценные бумаги',
      'Валюта',
    ];
    
    return largeTextLabels.any((largeLabel) => label.contains(largeLabel));
  }

  bool _shouldShowInfoIcon(String title) {
    const infoIconTitles = [
      'ЦБ Российских эмитентов',
      'Фьючерсы',
      'Драгоценные металлы',
      'Иностранные ценные бумаги',
      'Валюта',
      'Биржи',
    ];
    
    return infoIconTitles.any((iconTitle) => title.contains(iconTitle));
  }

  bool _isInstrumentsSection(String label) {
    return label.contains('Ценные бумаги, валюта и драгоценные металлы, фьючерсы, внебиржевой рынок');
  }

  String? _getTariffUrl(String tariffTitle) {
    switch (tariffTitle) {
      case 'Единый дневной':
        return 'https://broker.finam.ru/landing/tariffs-n2-day/';
      case 'Долгосрочный портфель':
        return 'https://broker.finam.ru/landing/tariffs-n1-dolgosrochniy/';
      case 'Инвестор':
        return 'https://broker.finam.ru/landing/tariffs-n3-investor/';
      case 'Стратег':
        return 'https://broker.finam.ru/landing/tariffs-n4-strateg/';
      case 'Единый Консультационный':
        return 'https://broker.finam.ru/landing/tariffs-n5-consulting/';
      default:
        return null;
    }
  }

  Future<void> _launchTariffUrl() async {
    final url = _getTariffUrl(tariffTitle);
    
    if (url != null) {
      final uri = Uri.parse(url);
      
      try {
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.platformDefault);
        } else {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      } catch (e) {
        // Ошибка при открытии URL - можно добавить обработку ошибок
        print('Ошибка при открытии URL: $e');
      }
    }
  }

  Widget _buildSection(TariffDetailSection section) {
    // Special handling for Instruments section
    if (section.title == 'Инструменты') {
      return _buildInstrumentsSection(section);
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Row(
          children: [
            Text(
              section.title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.textBaseDefault,
              ),
            ),
            if (_shouldShowInfoIcon(section.title)) ...[
              const SizedBox(width: 8),
              SvgPicture.asset(
                'assets/icons/info_circle_solid.svg',
                width: 18,
                height: 18,
              ),
            ],
          ],
        ),
        
        // Section items and groups
        if (section.groups != null) ...[
          const SizedBox(height: 12),
          ...section.groups!.map((group) => _buildGroup(group)),
        ],
        if (section.items.isNotEmpty) ...[
          if (section.groups == null) const SizedBox(height: 12),
          ...section.items.map((item) => _buildSectionItem(item)),
        ],
        
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildInstrumentsSection(TariffDetailSection section) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Text(
          section.title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.textBaseDefault,
          ),
        ),
        
        // Instruments content
        if (section.items.isNotEmpty) ...[
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFE5E5E7),
                  width: 0.5,
                ),
              ),
            ),
            child: Text(
              section.items.first.label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.textBaseSecondary,
              ),
            ),
          ),
        ],
        
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildGroup(TariffDetailGroup group) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Group header with icon
          Row(
            children: [
              Text(
                group.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textBaseDefault,
                ),
              ),
              if (_shouldShowInfoIcon(group.title)) ...[
                const SizedBox(width: 8),
                SvgPicture.asset(
                  'assets/icons/info_circle_solid.svg',
                  width: 18,
                  height: 18,
                ),
              ],
            ],
          ),
          
          const SizedBox(height: 4),
          
          // Group items
          ...group.items.map((item) => _buildGroupItem(item)),
        ],
      ),
    );
  }

  Widget _buildGroupItem(TariffDetailItem item) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE5E5E7),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              item.subLabel ?? item.label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.textBaseSecondary,
              ),
            ),
          ),
          Text(
            item.value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textBaseDefault,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionItem(TariffDetailItem item) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE5E5E7),
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label сверху
          Row(
            children: [
              Text(
                item.label,
                style: TextStyle(
                  fontSize: _isInstrumentsSection(item.label) ? 12 : 14,
                  fontWeight: FontWeight.w400,
                  color: _isInstrumentsSection(item.label) 
                      ? AppColors.textBaseSecondary 
                      : AppColors.textBaseDefault,
                ),
              ),
              if (_shouldShowInfoIcon(item.label)) ...[
                const SizedBox(width: 8),
                SvgPicture.asset(
                  'assets/icons/info_circle_solid.svg',
                  width: 18,
                  height: 18,
                ),
              ],
            ],
          ),
          // SubLabel и Value на одном уровне
          if (item.subLabel != null) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: Text(
                    item.subLabel!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBaseSecondary,
                    ),
                  ),
                ),
                Text(
                  item.value,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textBaseDefault,
                  ),
                ),
              ],
            ),
          ] else ...[
            // Если нет subLabel, то value справа от label
            Row(
              children: [
                const Spacer(),
                Text(
                  item.value,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textBaseDefault,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTradingPlatformsSection() {
    const platforms = [
      'Мобильное приложение FinamTrade',
      'Веб-терминал FinamTrade',
      'Transaq',
      'QUIK',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Доступные торговые платформы',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.textBaseDefault,
          ),
        ),
        
        const SizedBox(height: 12),
        
        ...platforms.map((platform) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              const Text(
                '- ',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textBaseSecondary,
                ),
              ),
              Expanded(
                child: Text(
                  platform,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textBaseSecondary,
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildConnectedTariffInfoSection() {
    // Получаем текущую дату
    final now = DateTime.now();
    final formattedDate = '${now.day.toString().padLeft(2, '0')}.${now.month.toString().padLeft(2, '0')}.${now.year}';
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/check.svg',
            width: 20,
            height: 20,
            colorFilter: const ColorFilter.mode(
              AppColors.buttonLabelGhost,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Начнет действовать с $formattedDate',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.buttonLabelGhost,
            ),
          ),
        ],
      ),
    );
  }
}

class TariffDetailSection {
  final String title;
  final bool hasInfoIcon;
  final List<TariffDetailItem> items;
  final List<TariffDetailGroup>? groups;

  const TariffDetailSection({
    required this.title,
    this.hasInfoIcon = false,
    this.items = const [],
    this.groups,
  });
}

class TariffDetailItem {
  final String label;
  final String? subLabel;
  final String value;

  const TariffDetailItem({
    required this.label,
    this.subLabel,
    required this.value,
  });
}

class TariffDetailGroup {
  final String title;
  final List<TariffDetailItem> items;

  const TariffDetailGroup({
    required this.title,
    required this.items,
  });
}

// Function to show the modal
void showTariffDetailsModal(
  BuildContext context, {
  required String tariffTitle,
  required String tariffDescription,
  required List<TariffDetailSection> sections,
  VoidCallback? onConnectTariff,
  bool isConnected = false,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 0.95,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) => TariffDetailsModal(
        tariffTitle: tariffTitle,
        tariffDescription: tariffDescription,
        sections: sections,
        onConnectTariff: onConnectTariff,
        isConnected: isConnected,
      ),
    ),
  );
} 