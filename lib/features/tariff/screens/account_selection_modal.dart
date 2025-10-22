import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/appcolors.dart';
import '../../../core/widgets/modal_header.dart';
import '../../../core/providers/account_provider.dart';
import '../widgets/account_selection_card.dart';
import 'tariff_change_screen.dart';

void showAccountSelectionModal(
  BuildContext context, {
  required String tariffTitle,
  bool isPersonalTariff = false,
  String? tariffPrice,
  String? tariffIcon,
  double? tariffIconSize,
  Color? tariffIconBackgroundColor,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => AccountSelectionModal(
      tariffTitle: tariffTitle,
      isPersonalTariff: isPersonalTariff,
      tariffPrice: tariffPrice,
      tariffIcon: tariffIcon,
      tariffIconSize: tariffIconSize,
      tariffIconBackgroundColor: tariffIconBackgroundColor,
    ),
  );
}

class AccountSelectionModal extends StatefulWidget {
  final String tariffTitle;
  final bool isPersonalTariff;
  final String? tariffPrice;
  final String? tariffIcon;
  final double? tariffIconSize;
  final Color? tariffIconBackgroundColor;
  
  const AccountSelectionModal({
    super.key, 
    required this.tariffTitle,
    this.isPersonalTariff = false,
    this.tariffPrice,
    this.tariffIcon,
    this.tariffIconSize,
    this.tariffIconBackgroundColor,
  });

  @override
  State<AccountSelectionModal> createState() => _AccountSelectionModalState();
}

class _AccountSelectionModalState extends State<AccountSelectionModal> {
  late int _selectedAccountIndex;

  final List<Map<String, dynamic>> _accounts = [
    // 1-й счет - Премиум с отрицательным изменением
    {
      'id': '15185RI112B',
      'name': 'Деньги на ветер',
      'balance': '1 593 742,90 ₽',
      'change': '−2947,23 ₽',
      'changeType': 'negative',
      'icon': 'wallet',
      'iconColor': AppColors.iconBaseSecondary,
      'backgroundColor': AppColors.opacityBase24,
    },
    // 2-й счет - Инвестор с положительным изменением
    {
      'id': '15185RI112B',
      'name': '123234',
      'balance': '448 742,90 ₽',
      'change': '0,00 ₽',
      'changeType': 'neutral',
      'icon': 'wallet',
      'iconColor': const Color(0xFF3178D7),
      'backgroundColor': const Color(0x1A3178D7), // 10% opacity
    },
    // 3-й счет - Единый дневной с нулевым изменением
    {
      'id': '15185RI112B',
      'name': '123234',
      'balance': '448 742,90 ₽',
      'change': '0,00 ₽',
      'changeType': 'neutral',
      'icon': 'wallet',
      'iconColor': AppColors.iconBaseSecondary,
      'backgroundColor': AppColors.opacityBase24,
    },
    // 4-й счет - Инвестор с положительным изменением
    {
      'id': '15185RI112B',
      'name': '123234',
      'balance': '448 742,90 ₽',
      'change': '+2947,93 ₽',
      'changeType': 'positive',
      'icon': 'wallet',
      'iconColor': const Color(0xFF3178D7),
      'backgroundColor': const Color(0x1A3178D7), // 10% opacity
    },
    // 5-й счет - ИИС
    {
      'id': '15185RI112B',
      'name': 'Деньги на ветер',
      'balance': '1 593 742,90 ₽',
      'change': '−2947,23 ₽',
      'changeType': 'negative',
      'icon': 'iis',
      'iconColor': const Color(0xFFEE8F4C),
      'backgroundColor': const Color(0x1AEE8F4C), // 10% opacity
    },
  ];

  @override
  void initState() {
    super.initState();
    // Находим индекс счета по имени из глобального состояния
    final accountProvider = Provider.of<AccountProvider>(context, listen: false);
    _selectedAccountIndex = _accounts.indexWhere(
      (account) => account['name'] == accountProvider.selectedAccountName,
    );
    if (_selectedAccountIndex == -1) {
      _selectedAccountIndex = 1; // По умолчанию второй счет
    }
  }

  String _getCurrentDateFormatted() {
    final now = DateTime.now();
    final months = [
      'янв', 'фев', 'мар', 'апр', 'май', 'июн',
      'июл', 'авг', 'сен', 'окт', 'ноя', 'дек'
    ];
    final day = now.day;
    final month = months[now.month - 1];
    final year = now.year;
    return 'с $day $month $year';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.bgBaseTertiary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              ModalHeader(
                title: 'Выберите счет',
                subtitle: 'Тариф привязывается к счету',
                onClose: () => Navigator.of(context).pop(),
              ),
              
              const SizedBox(height: 16),
              
              // Accounts list in single white container
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x11000000),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: List.generate(_accounts.length, (index) {
                    final account = _accounts[index];
                    final isSelected = _selectedAccountIndex == index;
                    final isLast = index == _accounts.length - 1;
                    
                    return AccountSelectionCard(
                      account: account,
                      isSelected: isSelected,
                      isLast: isLast,
                      onTap: () {
                        setState(() {
                          _selectedAccountIndex = index;
                        });
                        
                        // Сразу обновляем глобальное состояние при выборе счета
                        final accountProvider = Provider.of<AccountProvider>(context, listen: false);
                        accountProvider.selectAccountFromMap(account);
                      },
                    );
                  }),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Connect tariff button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // Получаем выбранный счет
                    final selectedAccount = _accounts[_selectedAccountIndex];
                    
                    // Закрываем модальное окно выбора счета
                    Navigator.of(context).pop();
                    
                    // Сразу переходим на экран смены тарифа
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TariffChangeScreen(
                          currentTariff: 'Инвестор', // Текущий тариф (можно сделать динамическим)
                          newTariff: widget.tariffTitle,
                          currentTariffCost: 'Бесплатно', // Текущая стоимость (можно сделать динамической)
                          newTariffCost: widget.tariffPrice ?? 'Бесплатно',
                          currentTariffDate: 'с 23 дек 2023', // Текущая дата (можно сделать динамической)
                          newTariffDate: _getCurrentDateFormatted(),
                          selectedAccountId: selectedAccount['id'],
                          selectedAccountName: selectedAccount['name'],
                          newTariffIcon: widget.tariffIcon,
                          newTariffIconSize: widget.tariffIconSize,
                          newTariffIconBackgroundColor: widget.tariffIconBackgroundColor,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonBgPrimaryDefault,
                    foregroundColor: AppColors.buttonLabelPrimary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Выбрать счет',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

