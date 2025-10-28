import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../theme/appcolors.dart';
import '../providers/profile_version_provider.dart';
import '../../features/home/screens/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;

  const BottomNavBar({
    super.key,
    this.currentIndex = 0,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  void _onItemTapped(int index) {
    // Only allow navigation for index 0 and 4
    if (index == 1 || index == 2 || index == 3) {
      return; // Do nothing for these items
    }

    setState(() {
      _selectedIndex = index;
    });

    // Navigate to different screens based on index
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 4:
        final versionProvider = Provider.of<ProfileVersionProvider>(context, listen: false);
        final profileScreen = versionProvider.getProfileScreen();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => profileScreen),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgGlassTertiary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(
                0,
                '../../../../assets/icons/main_screen/magnifying-solid.svg',
                'Что купить',
              ),
              _buildNavItem(
                1,
                '../../../../assets/icons/main_screen/briefcase-solid.svg',
                'Портфель',
              ),
              _buildNavItem(
                2,
                '../../../../assets/icons/main_screen/dashboard-solid.svg',
                'Продукты',
              ),
              _buildNavItem(
                3,
                '../../../../assets/icons/main_screen/message-solid.svg',
                'Чат',
              ),
              _buildNavItem(
                4,
                '../../../../assets/icons/main_screen/profile-solid.svg',
                'Профиль',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label) {
    final isSelected = _selectedIndex == index;
    final color = isSelected ? AppColors.bgBrandDefault : AppColors.iconBaseSecondary;

    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                iconPath,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

