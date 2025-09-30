import 'package:flutter/material.dart';

class TariffProvider extends ChangeNotifier {
  String _connectedTariff = 'Инвестор'; // По умолчанию подключен тариф "Инвестор"

  String get connectedTariff => _connectedTariff;

  void setConnectedTariff(String tariffName) {
    _connectedTariff = tariffName;
    notifyListeners();
  }

  bool isTariffConnected(String tariffName) {
    return _connectedTariff == tariffName;
  }
}
