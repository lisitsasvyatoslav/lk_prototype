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
      'description': 'Для активных трейдеров, совершающих сделки ежедневно',
      'price': '177 ₽/мес',
      'priceDetail': 'от 0,0354% за операции',
      'icon': 'assets/icons/daily_tariff.svg',
      'buttonText': 'Подключить',
      'iconBackgroundColor': const Color(0x1AFFB23F), // #FFB23F 10%
      'iconSize': 41.4,
    },
    {
      'title': 'Долгосрочный портфель',
      'subtitle': 'Бесплатно',
      'description': 'Для начинающих инвесторов, формирующих портфель. Для стратегии «купи и держи»',
      'price': 'Бесплатно',
      'priceDetail': 'от 0% за покупку ценных бумаг',
      'icon': 'assets/icons/wallet_transfer_send.svg',
      'buttonText': 'Подключить',
      'isPersonalTariff': true,
      'iconBackgroundColor': const Color(0x1A6FFF22), // #6FFF22 10%
      'iconSize': 37.57,
    },
    {
      'title': 'Инвестор',
      'subtitle': '200 ₽/мес',
      'description': 'Для опытных инвесторов с большим объемом операций. Максимально выгодные условия',
      'price': '200 ₽/мес',
      'priceDetail': 'от 0,0154% за операции',
      'icon': 'assets/icons/chart_forest.svg',
      'buttonText': 'Подключить',
      'iconBackgroundColor': const Color(0x1AFF91C1), // #FF91C1 10%
      'iconSize': 33.73,
    },
    {
      'title': 'Стартег',
      'subtitle': 'Бесплатно',
      'description': 'Для долгосрочных целей и редких сделок',
      'price': 'Бесплатно',
      'priceDetail': 'от 0,5% за сделки с ценными бумагами',
      'icon': 'assets/icons/rocket.24.svg',
      'buttonText': 'Подключить',
      'iconBackgroundColor': const Color(0x1AFF91C1), // #FF91C1 10%
      'iconSize': 33.73,
    },
    {
      'title': 'Единый Консультанционный',
      'subtitle': '177 ₽/мес',
      'description': 'С инвестидеями от профи',
      'price': '177 ₽/мес',
      'priceDetail': 'от 0,0354% за сделки с ценными бумагами',
      'icon': 'assets/icons/bubble.chart.24.svg',
      'buttonText': 'Подключить',
      'iconBackgroundColor': const Color(0x1AFF91C1), // #FF91C1 10%
      'iconSize': 33.73,
    },
  ];

  List<Widget> get _tariffs => _tariffData.map((data) => TariffCard(
    title: data['title'],
    subtitle: data['subtitle'],
    description: data['description'],
    price: data['price'],
    priceDetail: data['priceDetail'],
    icon: SvgPicture.asset(
      data['icon'],
      width: data['iconSize'],
      height: data['iconSize'],
    ),
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
          height: 337,
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
