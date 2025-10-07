import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'tariff_card.dart';

class TariffsCarousel extends StatefulWidget {
  final Function(String)? onTariffChanged;
  final String? initialTariff;
  final String? connectedTariff;
  
  const TariffsCarousel({
    super.key, 
    this.onTariffChanged,
    this.initialTariff,
    this.connectedTariff,
  });

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
      'description': 'Для активных трейдеров',
      'price': '177 ₽/мес',
      'priceDetail': 'от 0,0354% за операции',
      'icon': 'assets/icons/daily_tariff.svg',
      'buttonText': 'Подключить',
      'iconBackgroundColor': const Color(0x1AFFB23F), // #FFB23F 10%
      'iconSize': 41.4,
      'characteristics': [
        TariffCharacteristic(name: 'Ценные бумаги РФ', value: '0,0354%'),
        TariffCharacteristic(name: 'NASDAQ, HKEX, NYSE', value: '0,0354%'),
        TariffCharacteristic(name: 'Фьючерсы и опционы РФ', value: '0,0354%'),
      ],
    },
    {
      'title': 'Долгосрочный портфель',
      'subtitle': 'Бесплатно',
      'description': 'Для стратегии «Купи и держи»',
      'price': 'Бесплатно',
      'priceDetail': 'от 0% за покупку ценных бумаг',
      'icon': 'assets/icons/wallet_transfer_send.svg',
      'buttonText': 'Подключить',
      'isPersonalTariff': true,
      'iconBackgroundColor': const Color(0x1A6FFF22), // #6FFF22 10%
      'iconSize': 37.57,
      'characteristics': [
        TariffCharacteristic(name: 'Ценные бумаги РФ', value: '0%'),
        TariffCharacteristic(name: 'NASDAQ, HKEX, NYSE', value: '0,1%'),
        TariffCharacteristic(name: 'Фьючерсы и опционы РФ', value: '0,45 Р'),
      ],
    },
    {
      'title': 'Инвестор',
      'subtitle': '200 ₽/мес',
      'description': 'Выгодная торговля на иностранных рынках',
      'price': '200 ₽/мес',
      'priceDetail': 'от 0,0154% за операции',
      'icon': 'assets/icons/chart_forest.svg',
      'buttonText': 'Подключить',
      'iconBackgroundColor': const Color(0x1AFF91C1), // #FF91C1 10% - дефолтный цвет
      'iconSize': 33.73,
      'characteristics': [
        TariffCharacteristic(name: 'Ценные бумаги РФ', value: '0,0154%'),
        TariffCharacteristic(name: 'NASDAQ, HKEX, NYSE', value: '0,0154%'),
        TariffCharacteristic(name: 'Фьючерсы и опционы РФ', value: '0,0154%'),
      ],
    },
    {
      'title': 'Стратег',
      'subtitle': 'Бесплатно',
      'description': 'Для долгосрочных целей',
      'price': 'Бесплатно',
      'priceDetail': 'от 0,5% за сделки с ценными бумагами',
      'icon': 'assets/icons/rocket.24.svg',
      'buttonText': 'Подключить',
      'iconBackgroundColor': const Color(0x1A93C7FF), // #93C7FF 10%
      'iconSize': 33.73,
      'characteristics': [
        TariffCharacteristic(name: 'Ценные бумаги РФ', value: '0,5%'),
        TariffCharacteristic(name: 'NASDAQ, HKEX, NYSE', value: '0,5%'),
        TariffCharacteristic(name: 'Фьючерсы и опционы РФ', value: '0,5%'),
      ],
    },
    {
      'title': 'Единый Консультационный',
      'subtitle': '177 ₽/мес',
      'description': 'Инвестидет от профессионалов Финама',
      'price': '177 ₽/мес',
      'priceDetail': 'от 0,0354% за сделки с ценными бумагами',
      'icon': 'assets/icons/bubble.chart.24.svg',
      'buttonText': 'Подключить',
      'iconBackgroundColor': const Color(0x1AFF7A7C), // #FF7A7C 10%
      'iconSize': 33.73,
      'characteristics': [
        TariffCharacteristic(name: 'Ценные бумаги РФ', value: '0,0354%'),
        TariffCharacteristic(name: 'NASDAQ, HKEX, NYSE', value: '0,0354%'),
        TariffCharacteristic(name: 'Фьючерсы и опционы РФ', value: '0,0354%'),
      ],
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
    characteristics: (data['characteristics'] as List<TariffCharacteristic>?) ?? [],
    iconPath: data['icon'],
  )).toList();

  @override
  void initState() {
    super.initState();
    _initializePageController();
  }

  @override
  void didUpdateWidget(TariffsCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialTariff != widget.initialTariff) {
      _initializePageController();
    }
  }

  void _initializePageController() {
    // Находим индекс начального тарифа
    int initialIndex = 0;
    if (widget.initialTariff != null) {
      for (int i = 0; i < _tariffData.length; i++) {
        if (_tariffData[i]['title'] == widget.initialTariff) {
          initialIndex = i;
          break;
        }
      }
    }
    
    _pageController = PageController(
      viewportFraction: 0.9,
      initialPage: _tariffData.length * 1000 + initialIndex,
    );
    _currentPage = initialIndex;
    
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
          height: 426,
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
