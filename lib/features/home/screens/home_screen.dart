import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/appcolors.dart';
import '../../../core/providers/profile_version_provider.dart';
import '../../../core/widgets/bottom_nav_bar.dart';
import '../widgets/search_header.dart';
import '../widgets/tickers_list.dart';
import '../widgets/category_chips_section.dart';
import '../widgets/stocks_section.dart';
import '../widgets/collections_section.dart';
import '../widgets/investments_section.dart';
import '../widgets/stocks_under_1000_section.dart';
import '../widgets/news_section.dart';
import '../widgets/stories_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBaseTertiary,
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchHeader(),
              const SizedBox(height: 20),
              const TickersList(),
              const SizedBox(height: 20),
              const StoriesSection(),
              const SizedBox(height: 20),
              const CategoryChipsSection(),
              const SizedBox(height: 20),
              const InvestmentsSection(),
              const SizedBox(height: 20),
              const StocksSection(),
              const SizedBox(height: 20),
              const StocksUnder1000Section(),
              const SizedBox(height: 20),
              const NewsSection(),
              const SizedBox(height: 20),
              const CollectionsSection(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}