import '../features/quest/data/datasources/levels_local_data_source.dart';
import '../features/quest/data/repositories/in_memory_progress_repository.dart';
import '../features/quest/data/repositories/level_repository_impl.dart';
import '../features/quest/domain/usecases/complete_level.dart';
import '../features/quest/domain/usecases/get_levels.dart';
import '../features/quest/domain/usecases/get_progress.dart';
import '../features/quest/presentation/controllers/quest_controller.dart';

/// Raiz de composição: único lugar que conhece as implementações concretas.
QuestController buildQuestController() {
  final levelRepository = LevelRepositoryImpl(const LevelsLocalDataSource());
  final progressRepository = InMemoryProgressRepository();

  return QuestController(
    getLevels: GetLevels(levelRepository),
    getProgress: GetProgress(progressRepository),
    completeLevel: CompleteLevel(progressRepository),
  );
}
