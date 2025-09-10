import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../typography/text_18_semibold.dart';
import '../theme/appcolors.dart';

class AccordionSection extends StatefulWidget {
  final String title;
  final Widget child;
  final bool initiallyExpanded;
  final EdgeInsets? titlePadding;
  final EdgeInsets? contentPadding;
  final bool showDivider;

  const AccordionSection({
    super.key,
    required this.title,
    required this.child,
    this.initiallyExpanded = true,
    this.titlePadding,
    this.contentPadding,
    this.showDivider = true,
  });

  @override
  State<AccordionSection> createState() => _AccordionSectionState();
}

class _AccordionSectionState extends State<AccordionSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    
    if (widget.initiallyExpanded) {
      _isExpanded = true;
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Заголовок аккордеона
        InkWell(
          onTap: _toggleExpanded,
          borderRadius: BorderRadius.circular(0),
          child: Padding(
            padding: widget.titlePadding ?? const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text18Semibold(
                    text: widget.title,
                    color: AppColors.textBaseDefault,
                  ),
                ),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _animation.value * 3.14159, // 180 градусов
                      child: const Icon(
                        CupertinoIcons.chevron_down,
                        color: AppColors.iconBaseTertiary,
                        size: 16,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        // Контент аккордеона
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return SizeTransition(
              sizeFactor: _animation,
              child: Padding(
                padding: widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 0),
                child: widget.child,
              ),
            );
          },
        ),
        // Разделитель после аккордеона
        if (widget.showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.borderBaseDefault,
          ),
      ],
    );
  }
}
