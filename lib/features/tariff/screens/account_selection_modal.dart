import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/appcolors.dart';
import '../../../core/widgets/modal_header.dart';
import 'tariff_change_screen.dart';

void showAccountSelectionModal(
  BuildContext context, {
  required String tariffTitle,
  Function(Map<String, dynamic>)? onAccountSelected,
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
      onAccountSelected: onAccountSelected,
    ),
  );
}

class AccountSelectionModal extends StatefulWidget {
  final String tariffTitle;
  final Function(Map<String, dynamic>)? onAccountSelected;
  
  const AccountSelectionModal({
    super.key, 
    required this.tariffTitle,
    this.onAccountSelected,
  });

  @override
  State<AccountSelectionModal> createState() => _AccountSelectionModalState();
}

class _AccountSelectionModalState extends State<AccountSelectionModal> {
  int _selectedAccountIndex = 1; // По умолчанию выбран второй счет

  final List<Map<String, dynamic>> _accounts = [
    {
      'id': 'B0389',
      'name': 'Наименование счёта',
      'balance': '0,00 Р',
      'change': '0,00 Р',
      'changeType': 'neutral',
      'icon': 'wallet',
      'iconColor': AppColors.iconBaseSecondary,
      'backgroundColor': AppColors.opacityBase24,
    },
    {
      'id': '15185RAUZE',
      'name': 'Деньги на ветер',
      'balance': '193 451,00 Р',
      'change': '+542,90 Р',
      'changeType': 'positive',
      'icon': 'wallet',
      'iconColor': const Color(0xFF3178D7),
      'backgroundColor': const Color(0x1A3178D7), // 10% opacity
    },
    {
      'id': '15185RI112В',
      'name': 'КЛФ-918353',
      'balance': '87 198 345,33 P',
      'change': '+25 947,23 P',
      'changeType': 'positive',
      'icon': 'iis',
      'iconColor': const Color(0xFFEE8F4C),
      'backgroundColor': const Color(0x1AEE8F4C), // 10% opacity
    },
    {
      'id': '15185RI112B',
      'name': 'Account name',
      'balance': '50 742,90 Р',
      'change': '-147,00 Р',
      'changeType': 'negative',
      'icon': 'wallet',
      'iconColor': const Color(0xFFEE8F4C),
      'backgroundColor': const Color(0x1AEE8F4C), // 10% opacity
    },
  ];

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
                    
                    return Column(
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedAccountIndex = index;
                                });
                              },
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  // Account icon
                                  Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: account['backgroundColor'],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Center(
                                      child: account['icon'] == 'iis'
                                          ? SvgPicture.asset(
                                              'assets/icons/individual-invest.account.colored.24.svg',
                                              width: 24,
                                              height: 24,
                                              fit: BoxFit.contain,
                                            )
                                          : SvgPicture.asset(
                                              'assets/icons/wallet.24.svg',
                                              width: 24,
                                              height: 24,
                                              fit: BoxFit.contain,
                                              colorFilter: ColorFilter.mode(
                                                account['iconColor'],
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                    ),
                                  ),
                                  
                                  const SizedBox(width: 12),
                                  
                                  // Account info
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Balance
                                        Row(
                                          children: [
                                            Text(
                                              account['balance'],
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF303441),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              account['change'],
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: account['changeType'] == 'positive'
                                                    ? Colors.green
                                                    : account['changeType'] == 'negative'
                                                        ? Colors.red
                                                        : Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        // Account details
                                        Text(
                                          '${account['id']} • ${account['name']}',
                                          style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF5E6472),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  // Selection indicator
                                  AnimatedScale(
                                    scale: isSelected ? 1.0 : 0.0,
                                    duration: const Duration(milliseconds: 200),
                                    child: AnimatedOpacity(
                                      opacity: isSelected ? 1.0 : 0.0,
                                      duration: const Duration(milliseconds: 200),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/icons/check.svg',
                                          width: 24,
                                          height: 24,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Divider between items (except for the last one)
                        if (!isLast)
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: Color(0xFFF0F1F4),
                            indent: 16,
                            endIndent: 16,
                          ),
                      ],
                    );
                  }),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Connect tariff button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    final selectedAccount = _accounts[_selectedAccountIndex];
                    
                    // Вызываем callback с выбранным счетом
                    if (widget.onAccountSelected != null) {
                      widget.onAccountSelected!(selectedAccount);
                    }
                    
                    // Закрываем модальное окно выбора счета
                    Navigator.of(context).pop();
                    
                    // Открываем экран смены тарифа с данными о выбранном счете
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TariffChangeScreen(
                          currentTariff: 'Инвестор',
                          newTariff: 'Долгосрочный портфель',
                          currentTariffCost: 'Бесплатно',
                          newTariffCost: '200 ₽/мес',
                          currentTariffDate: 'с 23 дек 2023',
                          newTariffDate: 'с 23 авг 2025',
                          selectedAccountId: selectedAccount['id'],
                          selectedAccountName: selectedAccount['name'],
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
                    'Подключить тариф',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
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

