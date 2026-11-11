import 'package:flutter/material.dart';

import '../features/quest/presentation/controllers/quest_controller.dart';
import '../features/quest/presentation/pages/quest_page.dart';
import 'theme/app_theme.dart';

class AntiUxQuestApp extends StatelessWidget {
  const AntiUxQuestApp({super.key, required this.controller});

  final QuestController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anti-UX Quest',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      home: QuestPage(controller: controller),
    );
  }
}
