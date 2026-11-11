import 'package:anti_ux_quest/app/app.dart';
import 'package:anti_ux_quest/app/composition_root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('conclui a fase 1 digitando arroz e avança', (tester) async {
    tester.view.physicalSize = const Size(900, 1600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(AntiUxQuestApp(controller: buildQuestController()));

    for (final letter in 'arroz'.split('')) {
      await tester.tap(find.widgetWithText(FilledButton, letter));
    }
    await tester.pump();
    await tester.tap(find.text('ENVIAR'));
    await tester.pumpAndSettle();

    expect(find.text('FASE CONCLUÍDA'), findsOneWidget);

    await tester.tap(find.text('PRÓXIMA FASE'));
    await tester.pumpAndSettle();

    expect(find.text('FASE 02'), findsOneWidget);
  });
}
