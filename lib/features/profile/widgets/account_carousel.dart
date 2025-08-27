import 'package:flutter/material.dart';
import "../../../features/accounts/screens/accounts_list.dart" show showAccountsListModal;

class AccountCarousel extends StatefulWidget {
  final List<Widget> cards;

  const AccountCarousel({super.key, required this.cards});

  @override
  State<AccountCarousel> createState() => _AccountCarouselState();
}

class _AccountCarouselState extends State<AccountCarousel> {
  int _currentPage = 0;

  void _onSwipe(DragEndDetails details) {
    if (details.primaryVelocity == null) return;

    if (details.primaryVelocity! < 0) {
      if (_currentPage < widget.cards.length - 1) {
        setState(() => _currentPage++);
      }
    } else if (details.primaryVelocity! > 0) {
      if (_currentPage > 0) {
        setState(() => _currentPage--);
      }
    }
  }

  void _onDotTap(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cardHeight = 225.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Управление счетами",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              IconButton(
                icon: const Icon(Icons.more_horiz),
                iconSize: 28,
                onPressed: () {
                  showAccountsListModal(context);
                },
              ),
            ],
          ),
        ),
        GestureDetector(
          onHorizontalDragEnd: _onSwipe,
          child: SizedBox(
            height: cardHeight,
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: widget.cards[_currentPage],
              ),
            ),
          ),
        ),

        FractionallySizedBox(
          widthFactor: 0.9,
          child: Container(
            height: 5,
            decoration: const BoxDecoration(
              color: Color(0xFF1C1C1E),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x55000000),
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
        ),
        FractionallySizedBox(
          widthFactor: 0.85,
          child: Container(
            height: 5,
            decoration: const BoxDecoration(
              color: Color(0xFF1C1C1E),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x55000000),
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.cards.length, (index) {
            final isActive = index == _currentPage;
            return GestureDetector(
              onTap: () => _onDotTap(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 2),
                width: isActive ? 16 : 8,
                height: 2,
                decoration: BoxDecoration(
                  color: isActive ? Colors.orange : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
