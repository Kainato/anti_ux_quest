import '../../domain/entities/game_progress.dart';
import '../../domain/repositories/progress_repository.dart';

/// Mantém o progresso apenas em memória; troque por persistência local quando necessário.
class InMemoryProgressRepository implements ProgressRepository {
  GameProgress _progress = const GameProgress();

  @override
  GameProgress load() => _progress;

  @override
  void save(GameProgress progress) => _progress = progress;
}
