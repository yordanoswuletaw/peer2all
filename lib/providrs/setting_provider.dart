import 'package:flutter/cupertino.dart';

class SettingProvider with ChangeNotifier {
  bool _themeMode = false;

  void changeThemeMode() {
    _themeMode = !_themeMode;
    notifyListeners();
  }

  bool get themeMode => _themeMode;
}
