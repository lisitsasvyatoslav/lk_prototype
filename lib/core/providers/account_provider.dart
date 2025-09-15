import 'package:flutter/material.dart';

class AccountProvider extends ChangeNotifier {
  String _selectedAccountName = 'Деньги на ветер';
  String _selectedAccountId = '15185RAUZE';

  String get selectedAccountName => _selectedAccountName;
  String get selectedAccountId => _selectedAccountId;

  void selectAccount(String name, String id) {
    _selectedAccountName = name;
    _selectedAccountId = id;
    notifyListeners();
  }

  void selectAccountFromMap(Map<String, dynamic> account) {
    _selectedAccountName = account['name'] ?? 'Деньги на ветер';
    _selectedAccountId = account['id'] ?? '15185RAUZE';
    notifyListeners();
  }
}
