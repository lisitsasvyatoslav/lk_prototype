import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'tariff_card.dart';

class TariffsCarousel extends StatefulWidget {
  final Function(String)? onTariffChanged;
  
  const TariffsCarousel({super.key, this.onTariffChanged});

  @override
  State<TariffsCarousel> createState() => _TariffsCarouselState();
}

class _TariffsCarouselState extends State<TariffsCarousel> {
  late PageController _pageController;
  int _currentPage = 0;

  final List<Map<String, dynamic>> _tariffData = [
    {
      'title': 'Единый дневной',
      'subtitle': '177 ₽/мес',
      'icon': 'assets/icons/daily_tariff.svg',
      'services': [
        {'name': 'Ценные бумаги РФ', 'fee': 'до 0,0354%'},
        {'name': 'NASDAQ, HKEX, NYSE', 'fee': 'от 0,06%'},
        {'name': 'Фьючерсы и опционы РФ', 'fee': '0,45 ₽'},
      ],
      'maintenanceFee': '177 ₽',
      'buttonText': 'Подключить',
      'iconBackgroundColor': const Color(0x1AFFB23F), // #FFB23F 10%
      'iconSize': 41.4,
    },
    {
      'title': 'Долгосрочный портфель',
      'subtitle': 'Бесплатно',
      'icon': 'assets/icons/wallet_transfer_send.svg',
      'services': [
        {'name': 'Ценные бумаги РФ', 'fee': 'до 0,035%'},
        {'name': 'NASDAQ, HKEX, NYSE', 'fee': 'от 0,1%'},
        {'name': 'Фьючерсы и опционы РФ', 'fee': '0,45 ₽'},
      ],
      'maintenanceFee': '99 ₽',
      'buttonText': 'Подключить',
      'isPersonalTariff': true,
      'iconBackgroundColor': const Color(0x1A6FFF22), // #6FFF22 10%
      'iconSize': 37.57,
    },
    {
      'title': 'Инвестор',
      'subtitle': '200 ₽/мес',
      'icon': 'assets/icons/chart_forest.svg',
      'services': [
        {'name': 'Ценные бумаги РФ', 'fee': 'до 0,0154%'},
        {'name': 'NASDAQ, HKEX, NYSE', 'fee': 'от 0,03%'},
        {'name': 'Фьючерсы и опционы РФ', 'fee': '0,25 ₽'},
      ],
      'maintenanceFee': '299 ₽',
      'buttonText': 'Подключить',
      'iconBackgroundColor': const Color(0x1AFF91C1), // #FF91C1 10%
      'iconSize': 33.73,
    },
  ];

  List<Widget> get _tariffs => _tariffData.map((data) => TariffCard(
    title: data['title'],
    subtitle: data['subtitle'],
    icon: SvgPicture.asset(
      data['icon'],
      width: data['iconSize'],
      height: data['iconSize'],
    ),
    services: data['services'],
    maintenanceFee: data['maintenanceFee'],
    buttonText: data['buttonText'],
    iconBackgroundColor: data['iconBackgroundColor'],
    iconSize: data['iconSize'],
    isPersonalTariff: data['isPersonalTariff'] ?? false,
  )).toList();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.9,
      initialPage: _tariffData.length * 1000,
    );
    _currentPage = 0;
    // Уведомляем о начальном тарифе
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onTariffChanged?.call(_tariffData[_currentPage]['title']);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 375,
          child: PageView.builder(
            controller: _pageController,
            itemBuilder: (context, index) {
              final actualIndex = index % _tariffs.length;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: _tariffs[actualIndex],
              );
            },
            onPageChanged: (index) {
              setState(() {
                _currentPage = index % _tariffData.length;
              });
              // Уведомляем о смене тарифа
              widget.onTariffChanged?.call(_tariffData[_currentPage]['title']);
            },
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_tariffData.length, (index) {
            final isActive = _currentPage == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 2),
              height: 2,
              width: isActive ? 16 : 8,
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFFF97316) : const Color(0xFF9CA3AF),
                borderRadius: BorderRadius.circular(2),
              ),
            );
          }),
        ),
      ],
    );
  }
}
