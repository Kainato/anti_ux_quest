import 'package:flutter/material.dart';

import '../../domain/entities/app_theme_mode.dart';
import '../../domain/usecases/get_theme_mode.dart';
import '../../domain/usecases/save_theme_mode.dart';

class ThemeController extends ChangeNotifier {
  ThemeController({
    required GetThemeMode getThemeMode,
    required this._saveThemeMode,
  }) : _mode = getThemeMode();

  final SaveThemeMode _saveThemeMode;
  AppThemeMode _mode;

  AppThemeMode get mode => _mode;

  ThemeMode get themeMode =>
      _mode == AppThemeMode.dark ? ThemeMode.dark : ThemeMode.light;

  void toggle() {
    _mode = _mode == AppThemeMode.dark ? AppThemeMode.light : AppThemeMode.dark;
    notifyListeners();
    _saveThemeMode(_mode);
  }
}
