import 'package:flutter/material.dart';

import '../controllers/quest_controller.dart';
import '../widgets/about_quest_dialog.dart';
import '../widgets/compact_progress.dart';
import '../widgets/level_list_sheet.dart';
import '../widgets/level_map.dart';
import '../widgets/quest_content.dart';
import '../widgets/quest_drawer.dart';

class QuestPage extends StatelessWidget {
  const QuestPage({
    super.key,
    required this.controller,
    required this.onToggleTheme,
  });

  static const _wideBreakpoint = 720.0;

  final QuestController controller;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) => Scaffold(
        drawer: QuestDrawer(
          onShowLevels: () => showLevelListSheet(context, controller),
          onShowAbout: () => showAboutQuestDialog(context),
        ),
        appBar: _buildAppBar(context),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, bounds) {
              final wide = bounds.maxWidth >= _wideBreakpoint;
              final content = QuestContent(controller: controller);
              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1040),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      wide ? 32 : 20,
                      8,
                      wide ? 32 : 20,
                      22,
                    ),
                    child: wide
                        ? SingleChildScrollView(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(flex: 3, child: content),
                                const SizedBox(width: 36),
                                SizedBox(
                                  width: 240,
                                  child: LevelMap(controller: controller),
                                ),
                              ],
                            ),
                          )
                        : Column(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(child: content),
                              ),
                              const SizedBox(height: 16),
                              CompactProgress(controller: controller),
                            ],
                          ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AppBar(
      titleSpacing: 4,
      title: Text(
        'FASE ${(controller.currentIndex + 1).toString().padLeft(2, '0')}',
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w900,
          letterSpacing: 2,
        ),
      ),
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(Icons.menu_rounded),
        ),
      ),
      actions: [
        IconButton(
          onPressed: onToggleTheme,
          tooltip: isDark ? 'Tema claro' : 'Tema noturno',
          icon: Icon(
            isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 18, left: 4),
          child: Center(
            child: Text(
              '${controller.currentIndex + 1} / ${controller.levels.length}',
              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }
}
