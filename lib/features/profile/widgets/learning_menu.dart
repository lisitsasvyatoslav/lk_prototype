import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LearningMenuCard extends StatelessWidget {
  const LearningMenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    const divider = Divider(height: 1, thickness: 1, color: Color(0xFF3A3A42));

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: const [
          _MenuRow(
            leading: const Icon(
              CupertinoIcons.gift_fill,
              color: Color(0xFFFFA940),
              size: 24,
            ),
            title: 'Тестирования для инвесторов',
            subtitle: '2 из 4 тестов пройдено',
          ),
          divider,
          _MenuRow(
            leading: const Icon(
              CupertinoIcons.doc,
              color: Color(0xFFFFA940),
              size: 24,
            ),
            title: 'Центр обучения',
          ),
        ],
      ),
    );
  }
}

class _MenuRow extends StatelessWidget {
  final Widget leading;
  final String title;
  final String? subtitle;

  const _MenuRow({
    required this.leading,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    const double rowHeight = 64;
    return SizedBox(
      height: rowHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 16),
          leading,
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                if (subtitle != null) ...[
                  Text(
                    subtitle!,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFFA4A4B4),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.white38),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}


