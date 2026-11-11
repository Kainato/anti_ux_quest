import 'package:anti_ux_quest/app/composition_root.dart';
import 'package:anti_ux_quest/features/quest/presentation/controllers/quest_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<QuestController> _buildController() async {
  SharedPreferences.setMockInitialValues({});
  return (await buildDependencies()).questController;
}

void main() {
  test('completar a fase atual libera a próxima', () async {
    final controller = await _buildController();

    expect(controller.canOpen(1), isFalse);

    controller.completeCurrentLevel();

    expect(controller.isLevelComplete, isTrue);
    expect(controller.completedLevels, 1);
    expect(controller.canOpen(1), isTrue);
  });

  test('openLevel ignora fases bloqueadas', () async {
    final controller = await _buildController();

    controller.openLevel(3);

    expect(controller.currentIndex, 0);
  });

  test(
    'advance reinicia o estado e volta ao início após a última fase',
    () async {
      final controller = await _buildController();
      for (var i = 0; i < controller.levels.length; i++) {
        controller.completeCurrentLevel();
        controller.advance();
      }

      expect(controller.currentIndex, 0);
      expect(controller.isLevelComplete, isFalse);
    },
  );

  test('showNotice expõe a mensagem e completar a fase a limpa', () async {
    final controller = await _buildController();

    controller.showNotice('erro');
    expect(controller.notice, 'erro');

    controller.completeCurrentLevel();
    expect(controller.notice, isEmpty);
  });
}
