import '../entities/game_progress.dart';

abstract interface class ProgressRepository {
  GameProgress load();

  void save(GameProgress progress);
}
