import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/composition_root.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dependencies = await buildDependencies();

  runApp(
    AntiUxQuestApp(
      questController: dependencies.questController,
      themeController: dependencies.themeController,
    ),
  );
}
