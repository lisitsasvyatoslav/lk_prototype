import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/profile/screens/profile_version_selector_screen.dart';
import 'core/theme/appcolors.dart';
import 'core/providers/account_provider.dart';
import 'core/providers/profile_version_provider.dart';
import 'core/providers/tariff_provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountProvider()),
        ChangeNotifierProvider(create: (context) => ProfileVersionProvider()),
        ChangeNotifierProvider(create: (context) => TariffProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(),
          brightness: Brightness.light,
          primarySwatch: Colors.orange,
          scaffoldBackgroundColor: AppColors.bgBaseTertiary,
          colorScheme: ColorScheme.light(
            primary: AppColors.bgBrandDefault,
            onPrimary: AppColors.textOnBrandDefault,
            secondary: AppColors.bgBaseSecondary,
            onSecondary: AppColors.textBaseDefault,
            surface: AppColors.bgBaseDefault,
            onSurface: AppColors.textBaseDefault,
            background: AppColors.bgBaseTertiary,
            onBackground: AppColors.textBaseDefault,
          ),
        ),
        darkTheme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
          brightness: Brightness.dark,
          primarySwatch: Colors.orange,
          scaffoldBackgroundColor: AppColors.bgBaseTertiary,
          colorScheme: ColorScheme.dark(
            primary: AppColors.bgBrandDefault,
            onPrimary: AppColors.textOnBrandDefault,
            secondary: AppColors.bgBaseSecondary,
            onSecondary: AppColors.textBaseDefault,
            surface: AppColors.bgInverseDefault,
            onSurface: AppColors.textOnLightDefault,
            background: AppColors.bgBaseTertiary,
            onBackground: AppColors.textOnLightDefault,
          ),
        ),
        themeMode: _themeMode,
        home: MainScreen(toggleTheme: toggleTheme),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  const MainScreen({super.key, required this.toggleTheme});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return const ProfileVersionSelectorScreen();
  }
}
