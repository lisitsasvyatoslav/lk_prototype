import 'package:flutter/material.dart';
import 'story_card.dart';

class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Row(
          children: [
            StoryCard(
              iconAsset: '../../../../assets/images/stories/stories_1.png',
            ),
            SizedBox(width: 8),
            StoryCard(
              iconAsset: '../../../../assets/images/stories/stories_2.png',
            ),
            SizedBox(width: 8),
            StoryCard(
              iconAsset: '../../../../assets/images/stories/stories_3.png',
            ),
            SizedBox(width: 8),
            StoryCard(
              iconAsset: '../../../../assets/images/stories/stories_1.png',
            ),
            SizedBox(width: 8),
            StoryCard(
              iconAsset: '../../../../assets/images/stories/stories_2.png',
            ),
            SizedBox(width: 8),
            StoryCard(
              iconAsset: '../../../../assets/images/stories/stories_3.png',
            ),
          ],
        ),
      ),
    );
  }
}

