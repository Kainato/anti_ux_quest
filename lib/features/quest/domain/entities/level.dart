import 'challenge_type.dart';

class Level {
  const Level({
    required this.title,
    required this.objective,
    required this.pattern,
    required this.reflection,
    required this.challenge,
  });

  final String title;
  final String objective;
  final String pattern;
  final String reflection;
  final ChallengeType challenge;
}
