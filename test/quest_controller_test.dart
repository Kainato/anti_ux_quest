import 'package:anti_ux_quest/app/composition_root.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('completar a fase atual libera a próxima', () {
    final controller = buildQuestController();

    expect(controller.canOpen(1), isFalse);

    controller.completeCurrentLevel();

    expect(controller.isLevelComplete, isTrue);
    expect(controller.completedLevels, 1);
    expect(controller.canOpen(1), isTrue);
  });

  test('openLevel ignora fases bloqueadas', () {
    final controller = buildQuestController();

    controller.openLevel(3);

    expect(controller.currentIndex, 0);
  });

  test('advance reinicia o estado e volta ao início após a última fase', () {
    final controller = buildQuestController();
    for (var i = 0; i < controller.levels.length; i++) {
      controller.completeCurrentLevel();
      controller.advance();
    }

    expect(controller.currentIndex, 0);
    expect(controller.isLevelComplete, isFalse);
  });

  test('showNotice expõe a mensagem e completar a fase a limpa', () {
    final controller = buildQuestController();

    controller.showNotice('erro');
    expect(controller.notice, 'erro');

    controller.completeCurrentLevel();
    expect(controller.notice, isEmpty);
  });
}
