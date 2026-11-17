import '../entities/game_progress.dart';
import '../repositories/progress_repository.dart';

class CompleteLevel {
  const CompleteLevel(this._repository);

  final ProgressRepository _repository;

  GameProgress call(int levelIndex) {
    final progress = _repository.load().completing(levelIndex);
    _repository.save(progress);
    return progress;
  }
}
