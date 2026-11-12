import '../../domain/entities/level.dart';
import '../../domain/repositories/level_repository.dart';
import '../datasources/levels_local_data_source.dart';

class LevelRepositoryImpl implements LevelRepository {
  const LevelRepositoryImpl(this._dataSource);

  final LevelsLocalDataSource _dataSource;

  @override
  List<Level> getLevels() => _dataSource.fetchLevels();
}
