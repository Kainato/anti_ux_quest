import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../controllers/quest_controller.dart';

void showLevelListSheet(BuildContext context, QuestController controller) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: AppColors.paper,
    isScrollControlled: true,
    builder: (sheetContext) => SafeArea(
      child: SizedBox(
        height: MediaQuery.sizeOf(sheetContext).height * .75,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                'MAPA DA FRUSTRAÇÃO',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.levels.length,
                itemBuilder: (context, i) {
                  final level = controller.levels[i];
                  final unlocked = controller.canOpen(i);
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: i == controller.currentIndex
                          ? AppColors.yellow
                          : AppColors.sheetItemBackground,
                      child: Text(
                        '${i + 1}',
                        style: const TextStyle(color: AppColors.ink),
                      ),
                    ),
                    title: Text(level.title),
                    subtitle: Text(level.pattern),
                    trailing: Icon(
                      unlocked
                          ? Icons.chevron_right_rounded
                          : Icons.lock_outline_rounded,
                    ),
                    onTap: unlocked
                        ? () {
                            Navigator.pop(sheetContext);
                            controller.openLevel(i);
                          }
                        : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
