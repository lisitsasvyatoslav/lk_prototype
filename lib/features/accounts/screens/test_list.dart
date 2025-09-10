import 'package:flutter/material.dart';

class CardStackPage extends StatefulWidget {
  const CardStackPage({super.key});

  @override
  State<CardStackPage> createState() => _CardStackPageState();
}

class _CardStackPageState extends State<CardStackPage> {
  final ScrollController _scrollController = ScrollController();
  final double cardGap = 8.0;
  final Map<int, double> _cardHeights = {};

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  double _getCardHeight(int index) {
    if (_cardHeights.containsKey(index)) {
      return _cardHeights[index]!;
    }
    
    // Вычисляем высоту на основе контента
    final data = _getCardData(index);
    double height = 40; // номер карточки
    height += 6; // отступ
    height += 20; // заголовок
    height += 6; // отступ
    height += 20; // описание (примерная высота)
    height += 12; // отступ
    height += 12; // "Timings :"
    height += 2; // отступ
    height += (data['timings'].length * 14); // временные слоты
    height += 40; // отступы и padding
    height += 100; // изображение справа
    
    _cardHeights[index] = height;
    return height;
  }

  Map<String, dynamic> _getCardData(int index) {
    final List<Map<String, dynamic>> cardData = [
      {
        'title': 'Morning Rise Flow',
        'subtitle': 'Energizing vinyasa to start your day.',
        'timings': ['07:00 - 08:00 AM', '08:00 - 09:00 AM', '09:00 - 10:00 AM'],
        'image': 'assets/images/morning_flow.jpg',
      },
      {
        'title': 'Restorative & Yin',
        'subtitle': 'Slow, deep release to calm the nervous system.',
        'timings': ['07:00 - 08:00 AM', '08:00 - 09:00 AM', '09:00 - 10:00 AM'],
        'image': 'assets/images/restorative.jpg',
      },
      {
        'title': 'Plant-Based',
        'subtitle': 'Gentle movement for detox and nourishment.',
        'timings': ['07:00 - 08:00 AM', '08:00 - 09:00 AM', '09:00 - 10:00 AM'],
        'image': 'assets/images/plant_based.jpg',
      },
    ];
    return cardData[index % cardData.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F4F6),
        elevation: 0,
        title: const Text(
          'Карточки',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onPanUpdate: (details) {
              // Обрабатываем жесты скролла
              if (_scrollController.hasClients) {
                _scrollController.jumpTo(_scrollController.offset - details.delta.dy);
                setState(() {});
              }
            },
            child: NotificationListener<ScrollNotification>(
              onNotification: (_) {
                setState(() {}); // обновляем UI при скролле
                return true;
              },
              child: Stack(
                children: [
                  // Невидимый ListView для обработки скролла
                  ListView.builder(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      return SizedBox(height: _getCardHeight(index) + cardGap);
                    },
                  ),
                  // Видимые карточки с особым поведением для верхней карточки
                  ...List.generate(10, (index) {
                    double scrollOffset = _scrollController.hasClients ? _scrollController.offset : 0.0;
                    double cardHeight = _getCardHeight(index);
                    
                    // Вычисляем позицию карточки на основе накопленной высоты предыдущих карточек
                    double itemOffset = 0.0;
                    for (int i = 0; i < index; i++) {
                      itemOffset += _getCardHeight(i) + cardGap;
                    }
                    
                    // Вычисляем позицию карточки
                    double top = itemOffset - scrollOffset;
                    
                    // Особое поведение для верхней карточки - она остается фиксированной в верхней части
                    if (top < 0) {
                      top = 0; // Фиксируем в верхней части
                    }
                    
                    // Определяем, должна ли карточка быть видимой
                    bool isVisible = (itemOffset - scrollOffset) <= constraints.maxHeight && 
                                    (itemOffset - scrollOffset) >= -cardHeight;

                    if (!isVisible) return const SizedBox.shrink();

                    return Positioned(
                      top: top,
                      left: 20,
                      right: 20,
                      child: Container(
                        height: cardHeight,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 40,
                              offset: const Offset(0, 16),
                            ),
                          ],
                        ),
                        child: _buildCardContent(index),
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCardContent(int index) {
    final data = _getCardData(index);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${(index + 1).toString().padLeft(2, '0')}',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  data['title'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  data['subtitle'],
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Timings :',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 2),
                ...data['timings'].map<Widget>((timing) => Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: Text(
                    timing,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                    ),
                  ),
                )).toList(),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: Center(
              child: Icon(
                Icons.image,
                size: 32,
                color: Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    );
  }
}