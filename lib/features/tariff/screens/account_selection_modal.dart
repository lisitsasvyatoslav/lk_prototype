import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/appcolors.dart';
import '../../../core/widgets/modal_header.dart';
import '../../../core/providers/account_provider.dart';
import '../widgets/account_selection_card.dart';
import 'tariff_change_screen.dart';
import '../../accounts/data/accounts_data.dart';

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
    isDismissible: true,
    enableDrag: true,
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

  @override
  void initState() {
    super.initState();
    // Находим индекс счета по имени из глобального состояния
    final accountProvider = Provider.of<AccountProvider>(context, listen: false);
    final accounts = AccountsDataSource.getAllAccounts();
    _selectedAccountIndex = accounts.indexWhere(
      (account) => account.name == accountProvider.selectedAccountName,
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
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
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
                  children: List.generate(AccountsDataSource.getAllAccounts().length, (index) {
                    final accountData = AccountsDataSource.getAllAccounts()[index];
                    final isSelected = _selectedAccountIndex == index;
                    final isLast = index == AccountsDataSource.getAllAccounts().length - 1;
                    
                    // Преобразуем AccountData в Map для совместимости с AccountSelectionCard
                    final accountMap = {
                      'id': accountData.id,
                      'name': accountData.name,
                      'balance': accountData.balance,
                      'change': accountData.changeText,
                      'changeType': accountData.changeColor == AppColors.textNegativeDefault ? 'negative' :
                                   accountData.changeColor == AppColors.textPositiveDefault ? 'positive' : 'neutral',
                      'icon': accountData.icon ?? 'wallet',
                      'iconColor': accountData.iconColor ?? AppColors.iconBaseSecondary,
                      'backgroundColor': accountData.backgroundColor ?? AppColors.opacityBase24,
                    };
                    
                    return AccountSelectionCard(
                      account: accountMap,
                      isSelected: isSelected,
                      isLast: isLast,
                      onTap: () {
                        setState(() {
                          _selectedAccountIndex = index;
                        });
                        
                        // Сразу обновляем глобальное состояние при выборе счета
                        final accountProvider = Provider.of<AccountProvider>(context, listen: false);
                        accountProvider.selectAccountFromMap(accountMap);
                      },
                    );
                  }),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Connect tariff button
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonBgPrimaryDefault,
                        foregroundColor: AppColors.buttonLabelPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        // Получаем выбранный счет
                        final selectedAccountData = AccountsDataSource.getAllAccounts()[_selectedAccountIndex];
                        
                        // Закрываем модальное окно выбора счета
                        Navigator.of(context).pop();
                        
                        // Сразу переходим на экран смены тарифа
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TariffChangeScreen(
                              currentTariff: selectedAccountData.tariffTitle, // Текущий тариф из данных
                              newTariff: widget.tariffTitle,
                              currentTariffCost: 'Бесплатно', // Текущая стоимость (можно сделать динамической)
                              newTariffCost: widget.tariffPrice ?? 'Бесплатно',
                              currentTariffDate: 'с 23 дек 2023', // Текущая дата (можно сделать динамической)
                              newTariffDate: _getCurrentDateFormatted(),
                              selectedAccountId: selectedAccountData.id,
                              selectedAccountName: selectedAccountData.name,
                              newTariffIcon: widget.tariffIcon,
                              newTariffIconSize: widget.tariffIconSize,
                              newTariffIconBackgroundColor: widget.tariffIconBackgroundColor,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Выбрать счет',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
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

