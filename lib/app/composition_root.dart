import 'package:shared_preferences/shared_preferences.dart';

import '../features/quest/data/datasources/levels_local_data_source.dart';
import '../features/quest/data/repositories/in_memory_progress_repository.dart';
import '../features/quest/data/repositories/level_repository_impl.dart';
import '../features/quest/domain/usecases/complete_level.dart';
import '../features/quest/domain/usecases/get_levels.dart';
import '../features/quest/domain/usecases/get_progress.dart';
import '../features/quest/presentation/controllers/quest_controller.dart';
import '../features/theme/data/repositories/shared_preferences_theme_repository.dart';
import '../features/theme/domain/usecases/get_theme_mode.dart';
import '../features/theme/domain/usecases/save_theme_mode.dart';
import '../features/theme/presentation/controllers/theme_controller.dart';

class AppDependencies {
  const AppDependencies({
    required this.questController,
    required this.themeController,
  });

  final QuestController questController;
  final ThemeController themeController;
}

/// Raiz de composição: único lugar que conhece as implementações concretas.
Future<AppDependencies> buildDependencies() async {
  final preferences = await SharedPreferences.getInstance();

  final levelRepository = LevelRepositoryImpl(const LevelsLocalDataSource());
  final progressRepository = InMemoryProgressRepository();
  final themeRepository = SharedPreferencesThemeRepository(preferences);

  return AppDependencies(
    questController: QuestController(
      getLevels: GetLevels(levelRepository),
      getProgress: GetProgress(progressRepository),
      completeLevel: CompleteLevel(progressRepository),
    ),
    themeController: ThemeController(
      getThemeMode: GetThemeMode(themeRepository),
      saveThemeMode: SaveThemeMode(themeRepository),
    ),
  );
}
