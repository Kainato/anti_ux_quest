import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/app_theme_mode.dart';
import '../../domain/repositories/theme_repository.dart';

class SharedPreferencesThemeRepository implements ThemeRepository {
  const SharedPreferencesThemeRepository(this._preferences);

  static const _key = 'theme_mode';

  final SharedPreferences _preferences;

  @override
  AppThemeMode? load() {
    final name = _preferences.getString(_key);
    for (final mode in AppThemeMode.values) {
      if (mode.name == name) return mode;
    }
    return null;
  }

  @override
  Future<void> save(AppThemeMode mode) =>
      _preferences.setString(_key, mode.name);
}
