import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final String iconAsset;

  const StoryCard({
    super.key,
    required this.iconAsset,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        iconAsset,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}

