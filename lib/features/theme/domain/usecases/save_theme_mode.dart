import '../entities/app_theme_mode.dart';
import '../repositories/theme_repository.dart';

class SaveThemeMode {
  const SaveThemeMode(this._repository);

  final ThemeRepository _repository;

  Future<void> call(AppThemeMode mode) => _repository.save(mode);
}
