import 'package:flutter/material.dart';
import 'tariff_card.dart';
import '../../../core/theme/colors.dart';

class TariffsCarousel extends StatefulWidget {
  const TariffsCarousel({super.key});

  @override
  State<TariffsCarousel> createState() => _TariffsCarouselState();
}

class _TariffsCarouselState extends State<TariffsCarousel> {
  late PageController _pageController;
  int _currentPage = 0;

  final List<Widget> _tariffs = const [
    TariffCard(
      title: 'Единый дневной',
      subtitle: '177 ₽/мес',
      icon: Icons.wb_sunny,
      services: [
        {'name': 'Ценные бумаги РФ', 'fee': 'до 0,0354%'},
        {'name': 'NASDAQ, HKEX, NYSE', 'fee': 'от 0,06%'},
        {'name': 'Фьючерсы и опционы РФ', 'fee': '0,45 ₽'},
      ],
      maintenanceFee: '177 ₽',
      buttonText: 'Подключить',
    ),
    TariffCard(
      title: 'Долгосрочный портфель',
      subtitle: 'Бесплатно',
      icon: Icons.trending_up,
      services: [
        {'name': 'Ценные бумаги РФ', 'fee': 'до 0,035%'},
        {'name': 'NASDAQ, HKEX, NYSE', 'fee': 'от 0,1%'},
        {'name': 'Фьючерсы и опционы РФ', 'fee': '0,45 ₽'},
      ],
      maintenanceFee: '99 ₽',
      buttonText: 'Подключить',
      isPersonalTariff: true,
    ),
    TariffCard(
      title: 'Инвестор',
      subtitle: '200 ₽/мес',
      icon: Icons.star,
      services: [
        {'name': 'Ценные бумаги РФ', 'fee': 'до 0,0154%'},
        {'name': 'NASDAQ, HKEX, NYSE', 'fee': 'от 0,03%'},
        {'name': 'Фьючерсы и опционы РФ', 'fee': '0,25 ₽'},
      ],
      maintenanceFee: '299 ₽',
      buttonText: 'Подключить',
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
          height: 394,
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
                color: isActive ? AppColors.accent : AppColors.grey400,
                borderRadius: BorderRadius.circular(2),
              ),
            );
          }),
        ),
      ],
    );
  }
}
