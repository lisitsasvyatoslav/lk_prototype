import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/tariffs_carousel.dart';
import '../../../core/widgets/screen_header.dart';
import '../../../core/providers/account_provider.dart';
import '../../../core/providers/tariff_provider.dart';
import 'account_selection_modal.dart';

class TariffsScreenC extends StatefulWidget {
  final String? selectedTariff;
  final String? connectedTariff;
  
  const TariffsScreenC({super.key, this.selectedTariff, this.connectedTariff});

  @override
  State<TariffsScreenC> createState() => _TariffsScreenCState();
}

class _TariffsScreenCState extends State<TariffsScreenC> {
  late String _currentTariffTitle;

  @override
  void initState() {
    super.initState();
    _currentTariffTitle = widget.selectedTariff ?? 'Инвестор';
    
    // Устанавливаем подключенный тариф в TariffProvider
    // Если connectedTariff передан, используем его, иначе используем selectedTariff
    final connectedTariff = widget.connectedTariff ?? widget.selectedTariff ?? 'Инвестор';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final tariffProvider = Provider.of<TariffProvider>(context, listen: false);
      tariffProvider.setConnectedTariff(connectedTariff);
    });
  }

  @override
  void didUpdateWidget(TariffsScreenC oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedTariff != widget.selectedTariff) {
      _currentTariffTitle = widget.selectedTariff ?? 'Инвестор';
    }
    
    // Обновляем подключенный тариф в TariffProvider
    if (oldWidget.selectedTariff != widget.selectedTariff || oldWidget.connectedTariff != widget.connectedTariff) {
      final connectedTariff = widget.connectedTariff ?? widget.selectedTariff ?? 'Инвестор';
      final tariffProvider = Provider.of<TariffProvider>(context, listen: false);
      tariffProvider.setConnectedTariff(connectedTariff);
    }
  }

  void _onTariffChanged(String tariffTitle) {
    setState(() {
      _currentTariffTitle = tariffTitle;
    });
  }

  void _showAccountSelectionModal() {
    // Определяем, является ли текущий тариф персональным
    // Для примера считаем "Долгосрочный портфель" персональным тарифом
    bool isPersonalTariff = _currentTariffTitle == 'Долгосрочный портфель';
    
    showAccountSelectionModal(
      context,
      tariffTitle: _currentTariffTitle,
      isPersonalTariff: isPersonalTariff,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AccountProvider, TariffProvider>(
      builder: (context, accountProvider, tariffProvider, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF2F4F6),
          body: SafeArea(
            child: Column(
              children: [
                ScreenHeader(
                  title: 'Тарифы',
                  subtitle: accountProvider.selectedAccountName,
                  isSubtitleClickable: true,
                  onSubtitlePressed: _showAccountSelectionModal,
                ),
                
                // Main tariff card - центрируем по вертикали в оставшемся пространстве
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TariffsCarousel(
                        onTariffChanged: _onTariffChanged,
                        initialTariff: widget.selectedTariff ?? tariffProvider.connectedTariff,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
