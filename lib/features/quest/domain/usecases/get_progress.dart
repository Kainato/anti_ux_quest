import '../entities/game_progress.dart';
import '../repositories/progress_repository.dart';

class GetProgress {
  const GetProgress(this._repository);

  final ProgressRepository _repository;

  GameProgress call() => _repository.load();
}
