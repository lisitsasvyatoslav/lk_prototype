import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/appcolors.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Поле поиска
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.inputBgDefault,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  SvgPicture.asset(
                    '../../../../assets/icons/main_screen/magnifying-simple.svg',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'По названию',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBaseSecondary,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Иконка уведомлений
          Container(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                '../../../../assets/icons/main_screen/bell-outlined.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Иконка сообщений
          Container(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                '../../../../assets/icons/main_screen/envelope-outlined.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

