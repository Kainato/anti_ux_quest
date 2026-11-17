import 'package:anti_ux_quest/features/quest/domain/entities/game_progress.dart';
import 'package:anti_ux_quest/features/quest/domain/rules/challenge_rules.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ChallengeRules', () {
    test('isTargetWord ignora maiúsculas e minúsculas', () {
      expect(ChallengeRules.isTargetWord('ARROZ'), isTrue);
      expect(ChallengeRules.isTargetWord('arroz'), isTrue);
      expect(ChallengeRules.isTargetWord('feijao'), isFalse);
    });

    test('isValidIdentifier exige 8 dígitos', () {
      expect(ChallengeRules.isValidIdentifier('1234-5678'), isTrue);
      expect(ChallengeRules.isValidIdentifier('1234567'), isFalse);
    });

    test('meetsPasswordRequirements exige 8 caracteres e "ux"', () {
      expect(ChallengeRules.meetsPasswordRequirements('abcdefUX1'), isTrue);
      expect(ChallengeRules.meetsPasswordRequirements('abcdefgh'), isFalse);
      expect(ChallengeRules.meetsPasswordRequirements('ux'), isFalse);
    });

    test('isCorrectSkyColor aceita apenas Azul', () {
      expect(ChallengeRules.isCorrectSkyColor('Azul'), isTrue);
      expect(ChallengeRules.isCorrectSkyColor('Verde'), isFalse);
    });
  });

  group('GameProgress', () {
    test('libera apenas concluídas e a próxima fase', () {
      const progress = GameProgress(completedLevels: 2);
      expect(progress.canOpen(2), isTrue);
      expect(progress.canOpen(3), isFalse);
      expect(progress.isCompleted(1), isTrue);
      expect(progress.isCompleted(2), isFalse);
    });

    test('completing nunca reduz o progresso', () {
      const progress = GameProgress(completedLevels: 5);
      expect(progress.completing(1).completedLevels, 5);
      expect(progress.completing(5).completedLevels, 6);
    });
  });
}
