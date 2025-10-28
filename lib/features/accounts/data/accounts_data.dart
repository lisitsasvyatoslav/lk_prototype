import 'package:flutter/material.dart';
import '../../../core/theme/appcolors.dart';
import '../widgets/tariff_section.dart';

class AccountData {
  final String id;
  final String name;
  final String balance;
  final String changeText;
  final Color changeColor;
  final String number;
  final String subtitle;
  final bool isFavorite;
  final TariffType tariffType;
  final String tariffTitle;
  final String tariffSubtitle;
  final bool showIISIcon;
  final String? icon;
  final Color? iconColor;
  final Color? backgroundColor;

  const AccountData({
    required this.id,
    required this.name,
    required this.balance,
    required this.changeText,
    required this.changeColor,
    required this.number,
    required this.subtitle,
    required this.isFavorite,
    required this.tariffType,
    required this.tariffTitle,
    required this.tariffSubtitle,
    this.showIISIcon = false,
    this.icon,
    this.iconColor,
    this.backgroundColor,
  });
}

class AccountsDataSource {
  static const List<AccountData> accounts = [
    // 1-й счет - Инвестор с положительным изменением
    AccountData(
      id: '67891XY234Z',
      name: 'Инвестиционный портфель',
      balance: '4 567 890,15 ₽',
      changeText: '+8 765,43 ₽',
      changeColor: AppColors.textPositiveDefault,
      number: '67891XY234Z',
      subtitle: 'Инвестиционный портфель',
      isFavorite: true,
      tariffType: TariffType.portfolio,
      tariffTitle: 'Инвестор',
      tariffSubtitle: 'Текущий тариф',
      icon: 'wallet',
      iconColor: AppColors.iconBaseSecondary,
      backgroundColor: AppColors.opacityBase24,
    ),
    // 2-й счет - Единый дневной с положительным изменением
    AccountData(
      id: '28473RT889C',
      name: 'Торговый счет',
      balance: '756 234,50 ₽',
      changeText: '+1 234,56 ₽',
      changeColor: AppColors.textPositiveDefault,
      number: '28473RT889C',
      subtitle: 'Торговый счет',
      isFavorite: false,
      tariffType: TariffType.daily,
      tariffTitle: 'Единый дневной',
      tariffSubtitle: 'Текущий тариф',
      icon: 'wallet',
      iconColor: const Color(0xFF3178D7),
      backgroundColor: const Color(0x1A3178D7), // 10% opacity
    ),
    // 3-й счет - Стратег с нулевым изменением
    AccountData(
      id: '39284KL456D',
      name: 'Стратегический',
      balance: '2 145 678,00 ₽',
      changeText: '0,00 ₽',
      changeColor: AppColors.textBaseSecondary,
      number: '39284KL456D',
      subtitle: 'Стратегический',
      isFavorite: false,
      tariffType: TariffType.strategist,
      tariffTitle: 'Стратег',
      tariffSubtitle: 'Текущий тариф',
      icon: 'wallet',
      iconColor: AppColors.iconBaseSecondary,
      backgroundColor: AppColors.opacityBase24,
    ),
    // 4-й счет - Единый Консультационный с положительным изменением
    AccountData(
      id: '48592MN789E',
      name: 'Консультационный',
      balance: '3 267 891,25 ₽',
      changeText: '+5 678,90 ₽',
      changeColor: AppColors.textPositiveDefault,
      number: '48592MN789E',
      subtitle: 'Консультационный',
      isFavorite: false,
      tariffType: TariffType.consultative,
      tariffTitle: 'Единый Консультационный',
      tariffSubtitle: 'Текущий тариф',
      icon: 'wallet',
      iconColor: const Color(0xFF3178D7),
      backgroundColor: const Color(0x1A3178D7), // 10% opacity
    ),
    // 5-й счет - ИИС с отрицательным изменением
    AccountData(
      id: '15185RI112B',
      name: 'КЛФ-9182323',
      balance: '1 593 742,90 ₽',
      changeText: '−2947,23 ₽',
      changeColor: AppColors.textNegativeDefault,
      number: '15185RI112B',
      subtitle: 'Деньги на ветер',
      isFavorite: false,
      showIISIcon: true,
      tariffType: TariffType.longTerm,
      tariffTitle: 'Долгосрочный портфель',
      tariffSubtitle: 'Текущий тариф',
      icon: 'iis',
      iconColor: const Color(0xFFEE8F4C),
      backgroundColor: const Color(0x1AEE8F4C), // 10% opacity
    ),
  ];

  // Метод для получения всех счетов
  static List<AccountData> getAllAccounts() {
    return accounts;
  }

  // Метод для получения счета по индексу
  static AccountData? getAccountByIndex(int index) {
    if (index >= 0 && index < accounts.length) {
      return accounts[index];
    }
    return null;
  }

  // Метод для получения счета по ID
  static AccountData? getAccountById(String id) {
    try {
      return accounts.firstWhere((account) => account.id == id);
    } catch (e) {
      return null;
    }
  }

  // Метод для получения счета по имени
  static AccountData? getAccountByName(String name) {
    try {
      return accounts.firstWhere((account) => account.name == name);
    } catch (e) {
      return null;
    }
  }
}
