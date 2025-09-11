import 'package:flutter/material.dart';
import "../../../features/accounts/screens/accounts_list.dart" show navigateToAccountsListScreen;
import '../../../core/typography/text_16_medium.dart';
import '../../../core/theme/appcolors.dart';
import 'account_chart_card.dart';
import '../../accounts/widgets/account_list_item.dart';

class AccountCarousel extends StatefulWidget {
  final List<Widget> cards;

  const AccountCarousel({super.key, required this.cards});

  @override
  State<AccountCarousel> createState() => _AccountCarouselState();
}

class _AccountCarouselState extends State<AccountCarousel>
    with TickerProviderStateMixin {
  int _currentPage = 0;
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  bool _isAnimating = false;
  bool _isGoingBack = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500), // 0.5 секунды
      vsync: this,
    );

    _slideAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onSwipe(DragEndDetails details) {
    if (_isAnimating) return;
    
    if (details.primaryVelocity == null) return;

    if (details.primaryVelocity! < 0) {
      _animateToNext(); // Всегда можно перейти вперед
    } else if (details.primaryVelocity! > 0) {
      _animateToPrevious(); // Всегда можно перейти назад
    }
  }

  void _onDotTap(int index) {
    if (_isAnimating || index == _currentPage) return;
    
    if (index > _currentPage) {
      _animateToNext();
    } else {
      _animateToPrevious();
    }
  }

  void _animateToNext() {
    setState(() {
      _isAnimating = true;
      _isGoingBack = false;
    });

    _animationController.forward().then((_) {
      setState(() {
        _currentPage = (_currentPage + 1) % widget.cards.length; // Циклическое переключение
        _isAnimating = false;
      });
      _animationController.reset();
    });
  }

  void _animateToPrevious() {
    setState(() {
      _isAnimating = true;
      _isGoingBack = true;
    });

    _animationController.forward().then((_) {
      setState(() {
        _currentPage = (_currentPage - 1 + widget.cards.length) % widget.cards.length; // Циклическое переключение
        _isAnimating = false;
      });
      _animationController.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cardHeight = 110.0;

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
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBaseDefault,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_horiz, color: AppColors.iconBaseTertiary),
                iconSize: 28,
                onPressed: () {
                  navigateToAccountsListScreen(context);
                },
              ),
            ],
          ),
        ),
        GestureDetector(
          onHorizontalDragEnd: _onSwipe,
          child: SizedBox(
            height: cardHeight + 40, // Увеличиваем высоту для стопки карточек
            child: Stack(
              children: [
                // Третья карточка (самая нижняя)
                if (widget.cards.length >= 3)
                  Positioned(
                    top: 20,
                    left: 0,
                    right: 0,
                    child: Transform.scale(
                      scale: 0.85,
                      child: Opacity(
                        opacity: 0.5,
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          elevation: 2,
                          shadowColor: Colors.black.withOpacity(0.05),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: widget.cards[2],
                          ),
                        ),
                      ),
                    ),
                  ),
                
                // Вторая карточка (средняя)
                if (widget.cards.length >= 2)
                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: Transform.scale(
                      scale: 0.9,
                      child: Opacity(
                        opacity: 0.7,
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          elevation: 4,
                          shadowColor: Colors.black.withOpacity(0.1),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: widget.cards[1],
                          ),
                        ),
                      ),
                    ),
                  ),
                
                // Следующая карточка (поднимается из стопки при движении вперед)
                if (_isAnimating && !_isGoingBack)
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      final nextIndex = (_currentPage + 1) % widget.cards.length;
                      return Positioned(
                        top: 10 - (10 * _slideAnimation.value), // Поднимается с позиции 10px до 0px
                        left: 0,
                        right: 0,
                        child: Transform.scale(
                          scale: 0.9 + (_slideAnimation.value * 0.1), // Увеличивается с 0.9 до 1.0
                          child: Opacity(
                            opacity: 0.7 + (_slideAnimation.value * 0.3), // Появляется с 0.7 до 1.0
                            child: Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              elevation: 4 + (4 * _slideAnimation.value), // Тень увеличивается с 4 до 8
                              shadowColor: Colors.black.withOpacity(0.1 + (0.05 * _slideAnimation.value)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: widget.cards[nextIndex],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                
                // Предыдущая карточка (поднимается из стопки при движении назад)
                if (_isAnimating && _isGoingBack)
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      final prevIndex = (_currentPage - 1 + widget.cards.length) % widget.cards.length;
                      return Positioned(
                        top: 20 - (20 * _slideAnimation.value), // Поднимается с позиции 20px до 0px
                        left: 0,
                        right: 0,
                        child: Transform.scale(
                          scale: 0.85 + (_slideAnimation.value * 0.15), // Увеличивается с 0.85 до 1.0
                          child: Opacity(
                            opacity: 0.5 + (_slideAnimation.value * 0.5), // Появляется с 0.5 до 1.0
                            child: Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              elevation: 2 + (6 * _slideAnimation.value), // Тень увеличивается с 2 до 8
                              shadowColor: Colors.black.withOpacity(0.05 + (0.1 * _slideAnimation.value)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: widget.cards[prevIndex],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                
                // Активная карточка (анимированная - уезжает в сторону) - ПОСЛЕДНЯЯ в Stack
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Transform.translate(
                        offset: Offset(
                          _slideAnimation.value * 400 * 
                          (widget.cards.length > 1 ? 1 : 0) *
                          (_isGoingBack ? -1 : 1), // Уходит влево при движении назад
                          0,
                        ),
                        child: Transform.scale(
                          scale: 1.0 - (_slideAnimation.value * 0.1),
                          child: Transform.rotate(
                            angle: _slideAnimation.value * 0.3 * (_isGoingBack ? -1 : 1), // Поворот в зависимости от направления
                            child: Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              elevation: 8,
                              shadowColor: Colors.black.withOpacity(0.15),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: widget.cards[_currentPage],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 0),

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
                  color: isActive ? AppColors.indicatorBgActive : AppColors.indicatorBgInactive,
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
