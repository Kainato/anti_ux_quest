class GameProgress {
  const GameProgress({this.completedLevels = 0});

  final int completedLevels;

  /// Uma fase está liberada se for a próxima a ser jogada ou já tiver sido concluída.
  bool canOpen(int levelIndex) => levelIndex <= completedLevels;

  bool isCompleted(int levelIndex) => levelIndex < completedLevels;

  GameProgress completing(int levelIndex) {
    final completed = levelIndex + 1;
    return completed > completedLevels
        ? GameProgress(completedLevels: completed)
        : this;
  }
}
