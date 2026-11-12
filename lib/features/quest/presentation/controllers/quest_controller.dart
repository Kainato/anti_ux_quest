import 'package:flutter/foundation.dart';

import '../../domain/entities/game_progress.dart';
import '../../domain/entities/level.dart';
import '../../domain/usecases/complete_level.dart';
import '../../domain/usecases/get_levels.dart';
import '../../domain/usecases/get_progress.dart';

class QuestController extends ChangeNotifier {
  QuestController({
    required GetLevels getLevels,
    required GetProgress getProgress,
    required CompleteLevel completeLevel,
  }) : _levels = getLevels(),
       _progress = getProgress(),
       _completeLevel = completeLevel;

  final List<Level> _levels;
  final CompleteLevel _completeLevel;
  GameProgress _progress;

  int _currentIndex = 0;
  int _attempt = 0;
  bool _isLevelComplete = false;
  String _notice = '';

  List<Level> get levels => _levels;
  Level get currentLevel => _levels[_currentIndex];
  int get currentIndex => _currentIndex;
  int get completedLevels => _progress.completedLevels;
  bool get isLevelComplete => _isLevelComplete;
  bool get isLastLevel => _currentIndex == _levels.length - 1;
  String get notice => _notice;

  /// Muda a cada reinício de fase, forçando a recriação do estado do desafio.
  int get attempt => _attempt;

  double get journeyProgress => (_currentIndex + 1) / _levels.length;

  bool canOpen(int index) => _progress.canOpen(index);

  bool isCompleted(int index) => _progress.isCompleted(index);

  void completeCurrentLevel() {
    if (_isLevelComplete) return;
    _progress = _completeLevel(_currentIndex);
    _isLevelComplete = true;
    _notice = '';
    notifyListeners();
  }

  void showNotice(String message) {
    _notice = message;
    notifyListeners();
  }

  void advance() => _goTo(isLastLevel ? 0 : _currentIndex + 1);

  void openLevel(int index) {
    if (!canOpen(index)) return;
    _goTo(index);
  }

  void _goTo(int index) {
    _currentIndex = index;
    _attempt++;
    _isLevelComplete = false;
    _notice = '';
    notifyListeners();
  }
}
