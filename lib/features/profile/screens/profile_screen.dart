import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/index.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const UserProfileBlock(
            avatarUrl: 'https://i.pravatar.cc/150?img=3',
            userName: 'Александр Воронов',
          ),
          const SizedBox(height: 16),
          const TipsCards(),
          const SizedBox(height: 16),
          const PremiumStatusCard(),
          const SizedBox(height: 16),
          AccountCarousel(
            cards: [
              AccountCard(
                spots: [
                  FlSpot(0, 25),
                  FlSpot(1, 21),
                  FlSpot(2, 22),
                  FlSpot(3, 15),
                  FlSpot(4, 15),
                  FlSpot(5, 17),
                  FlSpot(6, 11),
                ],
              ),
              AccountCard(
                spots: [
                  FlSpot(0, 15),
                  FlSpot(1, 15),
                  FlSpot(2, 15),
                  FlSpot(3, 15),
                  FlSpot(4, 15),
                  FlSpot(5, 15),
                  FlSpot(6, 15),
                ],
              ),
              AccountCard(
                spots: [
                  FlSpot(0, 11),
                  FlSpot(1, 17),
                  FlSpot(2, 15),
                  FlSpot(3, 15),
                  FlSpot(4, 22),
                  FlSpot(5, 21),
                  FlSpot(6, 25),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const LearningMenuCard(),
          const SizedBox(height: 16),
          const MenusSection(),
        ],
      ),
    );
  }
}
