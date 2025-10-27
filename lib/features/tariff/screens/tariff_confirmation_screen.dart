import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/screen_header.dart';
import '../../../core/theme/appcolors.dart';
import '../../../core/providers/profile_version_provider.dart';
import '../../../core/providers/tariff_provider.dart';

class TariffConfirmationScreen extends StatelessWidget {
  final String newTariff;
  final String effectiveDate;

  const TariffConfirmationScreen({
    super.key,
    required this.newTariff,
    required this.effectiveDate,
  });

  String _getCurrentDate() {
    final now = DateTime.now();
    final day = now.day.toString().padLeft(2, '0');
    final month = now.month.toString().padLeft(2, '0');
    final year = now.year.toString();
    return '$day.$month.$year';
  }

  void _navigateToSelectedProfile(BuildContext context) {
    final profileProvider = Provider.of<ProfileVersionProvider>(context, listen: false);
    final tariffProvider = Provider.of<TariffProvider>(context, listen: false);
    
    // Обновляем подключенный тариф
    tariffProvider.setConnectedTariff(newTariff);
    
    final profileScreen = profileProvider.getProfileScreen();
    
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => profileScreen),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBaseTertiary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
        children: [
          ScreenHeader(
            title: 'Подтверждение',
            showBackButton: false,
            onClosePressed: () => _navigateToSelectedProfile(context),
          ),
          // Верхняя половина - контент
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  // Иконка подтверждения
                  SvgPicture.asset(
                    'assets/icons/check_circle.svg',
                    width: 48,
                    height: 48,
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Текст успеха
                  Text(
                    'Тариф успешно изменен',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPositiveDefault,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Дата вступления в силу
                  Text(
                    'Изменения вступят в силу ${_getCurrentDate()}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBaseSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
                ),
              ),
            ),
          ),
          
          // Баннер автоследования
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              height: 86, // Фиксированная высота баннера
              decoration: BoxDecoration(
                color: const Color(0xFFEDECF0),
                borderRadius: BorderRadius.circular(16),
              ),
               child: Stack(
                 children: [
                   // Image positioned at bottom right (background layer) - no padding
                   Positioned(
                     right: 0,
                     bottom: 0,
                     child: ClipRRect(
                       borderRadius: const BorderRadius.only(
                         topRight: Radius.circular(16),
                         bottomRight: Radius.circular(16),
                       ),
                       child: Image(
                         image: AssetImage('assets/images/autofollow_banner.png'),
                         width: 140,
                         height: 86,
                         fit: BoxFit.cover,
                         errorBuilder: (context, error, stackTrace) {
                           return Container(
                             width: 140,
                             height: 86,
                             color: Colors.grey[300],
                             child: const Center(
                               child: Text(
                                 'Изображение не найдено',
                                 style: TextStyle(color: Colors.red, fontSize: 10),
                               ),
                             ),
                           );
                         },
                       ),
                     ),
                   ),
                   // Text content (foreground) - поверх изображения
                   Padding(
                     padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(
                           'Автоследование',
                           style: TextStyle(
                             fontSize: 14,
                             fontWeight: FontWeight.w500,
                             color: AppColors.textBaseDefault,
                           ),
                         ),
                         const SizedBox(height: 4),
                         Text(
                           'Автоследование за опытными\nтрейдерами',
                           style: TextStyle(
                             fontSize: 12,
                             fontWeight: FontWeight.w400,
                             color: AppColors.textBaseSecondary,
                             height: 1.3,
                           ),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
            ),
          ),
          
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonBgSecondaryDefault,
                    foregroundColor: AppColors.buttonLabelSecondary,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () => _navigateToSelectedProfile(context),
                  child: const Text(
                    'Вернуться к профилю',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ],
          ),
        ),
      ),
    );
  }
}
