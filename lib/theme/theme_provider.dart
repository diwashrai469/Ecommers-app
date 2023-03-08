import 'package:flutter/material.dart';

class ThemeChangerBool with ChangeNotifier {
  bool _iconBool = false;

  bool get iconBool => _iconBool;

  void setBoolVal() {
    _iconBool = !_iconBool;
    notifyListeners();
  }
}
