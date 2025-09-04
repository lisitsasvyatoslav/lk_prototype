import 'package:flutter/material.dart';

class CollapsingCardsDemo extends StatelessWidget {
  const CollapsingCardsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = List.generate(6, (index) => 'Счёт №${index + 1}');

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return NotificationListener<ScrollNotification>(
                onNotification: (_) => true,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    return _buildCard(context, cards[index], index);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, int index) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: index == 5 ? 0 : -60, // перекрытие
          ),
          child: Transform.translate(
            offset: Offset(0, index * 0.0), // можно поиграть со смещением
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
