import 'package:flutter/material.dart';

import '../features/quest/presentation/controllers/quest_controller.dart';
import '../features/quest/presentation/pages/quest_page.dart';
import '../features/theme/presentation/controllers/theme_controller.dart';
import 'theme/app_theme.dart';

class AntiUxQuestApp extends StatelessWidget {
  const AntiUxQuestApp({
    super.key,
    required this.questController,
    required this.themeController,
  });

  final QuestController questController;
  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeController,
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Anti-UX Quest',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeController.themeMode,
        home: QuestPage(
          controller: questController,
          onToggleTheme: themeController.toggle,
        ),
      ),
    );
  }
}
