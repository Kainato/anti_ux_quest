import 'package:anti_ux_quest/app/app.dart';
import 'package:anti_ux_quest/app/composition_root.dart';
import 'package:anti_ux_quest/app/theme/app_theme.dart';
import 'package:anti_ux_quest/features/quest/presentation/widgets/tiny_target_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _pumpApp(WidgetTester tester) async {
  tester.view.physicalSize = const Size(900, 1600);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  final dependencies = await buildDependencies();
  await tester.pumpWidget(
    AntiUxQuestApp(
      questController: dependencies.questController,
      themeController: dependencies.themeController,
    ),
  );
}

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  testWidgets('conclui a fase 1 digitando arroz e avança', (tester) async {
    await _pumpApp(tester);

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

  testWidgets('botão da appbar alterna o tema e persiste a escolha', (
    tester,
  ) async {
    await _pumpApp(tester);

    expect(
      Theme.of(tester.element(find.byType(Scaffold))).brightness,
      Brightness.dark,
    );

    await tester.tap(find.byIcon(Icons.light_mode_rounded));
    await tester.pumpAndSettle();

    expect(
      Theme.of(tester.element(find.byType(Scaffold))).brightness,
      Brightness.light,
    );
    expect(
      (await SharedPreferences.getInstance()).getString('theme_mode'),
      'light',
    );
  });

  testWidgets('alvos customizados usam cursor de clique ao passar o mouse', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.dark,
        home: Scaffold(
          body: Center(child: TinyTargetDot(size: 40, onTap: () {})),
        ),
      ),
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is MouseRegion && widget.cursor == SystemMouseCursors.click,
      ),
      findsOneWidget,
    );
  });

  testWidgets('reabrir o app restaura o último tema escolhido', (tester) async {
    SharedPreferences.setMockInitialValues({'theme_mode': 'light'});

    await _pumpApp(tester);

    expect(
      Theme.of(tester.element(find.byType(Scaffold))).brightness,
      Brightness.light,
    );
  });
}
