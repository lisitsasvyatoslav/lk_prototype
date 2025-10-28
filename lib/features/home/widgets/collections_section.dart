import 'package:flutter/material.dart';
import '../../../core/theme/appcolors.dart';
import 'list_item.dart';

class CollectionsSection extends StatelessWidget {
  const CollectionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Text(
              'Все подборки',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.textBaseDefault,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ListItem(text: 'Title'),
                const Divider(height: 1, color: AppColors.borderBaseDefault),
                const ListItem(text: 'Title'),
                const Divider(height: 1, color: AppColors.borderBaseDefault),
                const ListItem(text: 'Title'),
                const Divider(height: 1, color: AppColors.borderBaseDefault),
                const ListItem(text: 'Title'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

