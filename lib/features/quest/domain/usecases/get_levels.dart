import '../entities/level.dart';
import '../repositories/level_repository.dart';

class GetLevels {
  const GetLevels(this._repository);

  final LevelRepository _repository;

  List<Level> call() => _repository.getLevels();
}
