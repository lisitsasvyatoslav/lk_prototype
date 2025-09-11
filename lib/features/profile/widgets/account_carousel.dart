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
  
  // Константы для оптимизации
  static const double _cardHeight = 110.0;
  static const double _animationDuration = 500.0;
  static const int _maxVisibleCards = 3; // Максимум видимых карточек
  
  // Кэш для мемоизированных виджетов
  final Map<int, Widget> _cachedCards = {};

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: _animationDuration.round()),
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
    _cachedCards.clear();
    super.dispose();
  }
  
  // Получение мемоизированной карточки для оптимизации
  Widget _getCachedCard(int index) {
    if (!_cachedCards.containsKey(index)) {
      _cachedCards[index] = widget.cards[index];
    }
    return _cachedCards[index]!;
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
            height: _cardHeight + 40, // Увеличиваем высоту для стопки карточек
            child: Stack(
              children: [
                // Оптимизированная стопка карточек (только видимые + эффект глубины)
                if (widget.cards.length >= 3) ...[
                  // 3-я карточка (реальная)
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
                            child: _getCachedCard(2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  // Эффект стопки для дополнительных карточек (4-я и далее)
                  if (widget.cards.length > 3)
                    Positioned(
                      top: 22,
                      left: 0,
                      right: 0,
                      child: Transform.scale(
                        scale: 0.84,
                        child: Opacity(
                          opacity: 0.3,
                          child: Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            elevation: 1,
                            shadowColor: Colors.black.withOpacity(0.03),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: _cardHeight,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.grey.withOpacity(0.1),
                                      Colors.grey.withOpacity(0.05),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '+${widget.cards.length - 3}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
                
                // Вторая карточка (средняя) - с RepaintBoundary для оптимизации
                if (widget.cards.length >= 2)
                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: RepaintBoundary(
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
                              child: _getCachedCard(1),
                            ),
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
                                child: _getCachedCard(nextIndex),
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
                                child: _getCachedCard(prevIndex),
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
                      child: RepaintBoundary(
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
                                child: _getCachedCard(_currentPage),
              ),
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
