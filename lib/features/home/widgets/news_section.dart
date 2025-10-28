import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/appcolors.dart';
import 'news_item.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Новости',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBaseDefault,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Detail',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textBaseSecondary,
                        ),
                      ),
                      const SizedBox(width: 4),
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: SvgPicture.asset(
                          'assets/icons/tariffs.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
              NewsItem(
                title: 'События предстоящих дней: пройдут советы директоров "ФосАгро" и "Энел Россия"',
                time: 'Сегодня, 18:21',
                source: 'Finam',
                iconAssets: [
                  '../../../../assets/icons/main_screen/rosneft_symbol.svg',
                  '../../../../assets/icons/main_screen/us_flag_symbol.svg',
                  '../../../../assets/icons/main_screen/ru_flag_symbol.svg',
                ],
              ),
              Divider(height: 1, color: AppColors.borderBaseDefault),
              NewsItem(
                title: 'Иран без урана. Мир близок к новому ядерному соглашению',
                time: 'Сегодня, 17:50',
                source: 'Finam',
              ),
              Divider(height: 1, color: AppColors.borderBaseDefault),
              NewsItem(
                title: 'Иран без урана. Мир близок к новому ядерному соглашению',
                time: 'Сегодня, 17:50',
                source: 'Finam',
              ),
              Divider(height: 1, color: AppColors.borderBaseDefault),
              NewsItem(
                title: 'На каждую подешевевшую акцию индекса МосБиржи приходилось пять прибавивших в цене бумаг',
                time: 'Сегодня, 17:50',
                source: 'Finam',
                iconAssets: ['../../../../assets/icons/main_screen/rosneft_symbol.svg'],
              ),
              Divider(height: 1, color: AppColors.borderBaseDefault),
              NewsItem(
                title: 'Кабмин утвердил Концепцию законодательного регулирования оборота цифровых валют',
                time: 'Сегодня, 14:20',
                source: 'Finam',
                iconAssets: [
                  '../../../../assets/icons/main_screen/rosneft_symbol.svg',
                  '../../../../assets/icons/main_screen/us_flag_symbol.svg',
                  '../../../../assets/icons/main_screen/ru_flag_symbol.svg',
                ],
              ),
              ],
            ),
          ),
        ],
      );
  }
}