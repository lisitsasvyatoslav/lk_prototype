import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'tariff_card.dart';

class TariffsCarousel extends StatefulWidget {
  const TariffsCarousel({super.key});

  @override
  State<TariffsCarousel> createState() => _TariffsCarouselState();
}

class _TariffsCarouselState extends State<TariffsCarousel> {
  late PageController _pageController;
  int _currentPage = 0;

  final List<Widget> _tariffs = [
    TariffCard(
      title: 'Единый дневной',
      subtitle: '177 ₽/мес',
      icon: SvgPicture.asset(
        'assets/icons/daily_tariff.svg',
        width: 41.4,
        height: 41.4,
      ),
      services: const [
        {'name': 'Ценные бумаги РФ', 'fee': 'до 0,0354%'},
        {'name': 'NASDAQ, HKEX, NYSE', 'fee': 'от 0,06%'},
        {'name': 'Фьючерсы и опционы РФ', 'fee': '0,45 ₽'},
      ],
      maintenanceFee: '177 ₽',
      buttonText: 'Подключить',
      iconBackgroundColor: const Color(0x1AFFB23F), // #FFB23F 10%
      iconSize: 41.4,
    ),
    TariffCard(
      title: 'Долгосрочный портфель',
      subtitle: 'Бесплатно',
      icon: SvgPicture.asset(
        'assets/icons/wallet_transfer_send.svg',
        width: 37.57,
        height: 34.09,
      ),
      services: const [
        {'name': 'Ценные бумаги РФ', 'fee': 'до 0,035%'},
        {'name': 'NASDAQ, HKEX, NYSE', 'fee': 'от 0,1%'},
        {'name': 'Фьючерсы и опционы РФ', 'fee': '0,45 ₽'},
      ],
      maintenanceFee: '99 ₽',
      buttonText: 'Подключить',
      isPersonalTariff: true,
      iconBackgroundColor: const Color(0x1A6FFF22), // #6FFF22 10%
      iconSize: 37.57,
    ),
    TariffCard(
      title: 'Инвестор',
      subtitle: '200 ₽/мес',
      icon: SvgPicture.asset(
        'assets/icons/chart_forest.svg',
        width: 33.73,
        height: 33.73,
      ),
      services: const [
        {'name': 'Ценные бумаги РФ', 'fee': 'до 0,0154%'},
        {'name': 'NASDAQ, HKEX, NYSE', 'fee': 'от 0,03%'},
        {'name': 'Фьючерсы и опционы РФ', 'fee': '0,25 ₽'},
      ],
      maintenanceFee: '299 ₽',
      buttonText: 'Подключить',
      iconBackgroundColor: const Color(0x1AFF91C1), // #FF91C1 10%
      iconSize: 33.73,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.9,
      initialPage: _tariffs.length * 1000,
    );
    _currentPage = 0;
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
                _currentPage = index % _tariffs.length;
              });
            },
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_tariffs.length, (index) {
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
