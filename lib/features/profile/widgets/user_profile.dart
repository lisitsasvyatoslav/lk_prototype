import 'package:flutter/material.dart';
import '../../../core/theme/appcolors.dart';

class UserProfileBlock extends StatelessWidget {
  final String avatarUrl;
  final String userName;

  const UserProfileBlock({
    super.key,
    required this.avatarUrl,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 40, backgroundImage: NetworkImage(avatarUrl)),
        const SizedBox(height: 24),
        Text(
          userName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textBaseDefault,
          ),
        ),
      ],
    );
  }
}
