import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../agreements/widgets/agreements_modal.dart';
import '../../../core/providers/tariff_provider.dart';

class AnimatedTariffAgreementsButton extends StatefulWidget {
  final String currentTariff;
  
  const AnimatedTariffAgreementsButton({
    super.key,
    required this.currentTariff,
  });

  @override
  State<AnimatedTariffAgreementsButton> createState() => _AnimatedTariffAgreementsButtonState();
}

class _AnimatedTariffAgreementsButtonState extends State<AnimatedTariffAgreementsButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<double> _translateYAnimation;
  
  bool _shouldShow = false;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    _translateYAnimation = Tween<double>(
      begin: -20.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));
    
    // Проверяем видимость после инициализации
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateVisibility();
    });
  }

  @override
  void didUpdateWidget(AnimatedTariffAgreementsButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentTariff != widget.currentTariff) {
      _updateVisibility();
    }
  }

  void _updateVisibility() {
    final tariffProvider = Provider.of<TariffProvider>(context, listen: false);
    final isConnected = tariffProvider.isTariffConnected(widget.currentTariff);
    
    if (isConnected && !_shouldShow) {
      setState(() {
        _shouldShow = true;
      });
      _animationController.forward();
    } else if (!isConnected && _shouldShow) {
      setState(() {
        _shouldShow = false;
      });
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TariffProvider>(
      builder: (context, tariffProvider, child) {
        // Обновляем видимость при изменении TariffProvider
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _updateVisibility();
        });
        
        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            // Показываем виджет если он должен быть виден ИЛИ если анимация еще не завершена
            final shouldShowWidget = _shouldShow || _animationController.value > 0;
            
            return Opacity(
              opacity: _opacityAnimation.value,
              child: Transform.translate(
                offset: Offset(0, _translateYAnimation.value),
                child: shouldShowWidget ? const TariffAgreementsButton() : const SizedBox.shrink(),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class TariffAgreementsButton extends StatelessWidget {
  const TariffAgreementsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: () => navigateToAgreementsScreen(context),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        icon: const Icon(
          Icons.description_outlined,
          size: 20,
          color: Color(0xFF6B7280),
        ),
        label: const Text(
          'Соглашения по тарифу',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF6B7280),
          ),
        ),
      ),
    );
  }
}