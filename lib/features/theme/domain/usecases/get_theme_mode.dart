import '../entities/app_theme_mode.dart';
import '../repositories/theme_repository.dart';

class GetThemeMode {
  const GetThemeMode(this._repository);

  final ThemeRepository _repository;

  AppThemeMode call() => _repository.load() ?? AppThemeMode.dark;
}
