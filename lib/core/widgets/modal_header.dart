import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ModalHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onClose;
  final Widget? leading;

  const ModalHeader({
    super.key,
    required this.title,
    this.onClose,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Leading widget (optional)
        if (leading != null) leading!,
        if (leading == null) const SizedBox(width: 48), // Заглушка для баланса
        
        // Title
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color(0xFF303441),
            ),
          ),
        ),
        
        // Close button
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/dismiss.circle.small.colored.24.svg',
            width: 28,
            height: 28,
            fit: BoxFit.contain,
          ),
          onPressed: onClose ?? () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
