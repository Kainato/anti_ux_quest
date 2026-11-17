import '../entities/app_theme_mode.dart';

abstract interface class ThemeRepository {
  /// Retorna `null` quando a pessoa ainda não escolheu um tema.
  AppThemeMode? load();

  Future<void> save(AppThemeMode mode);
}
