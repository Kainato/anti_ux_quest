import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../controllers/quest_controller.dart';

class LevelMap extends StatelessWidget {
  const LevelMap({super.key, required this.controller});

  final QuestController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'MAPA DA FRUSTRAÇÃO',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 11,
            letterSpacing: 1.4,
          ),
        ),
        const SizedBox(height: 14),
        for (var i = 0; i < controller.levels.length; i++)
          _LevelMapItem(
            index: i,
            title: controller.levels[i].title,
            isActive: i == controller.currentIndex,
            isUnlocked: controller.canOpen(i),
            isCompleted: controller.isCompleted(i),
            onTap: () => controller.openLevel(i),
          ),
      ],
    );
  }
}

class _LevelMapItem extends StatelessWidget {
  const _LevelMapItem({
    required this.index,
    required this.title,
    required this.isActive,
    required this.isUnlocked,
    required this.isCompleted,
    required this.onTap,
  });

  final int index;
  final String title;
  final bool isActive;
  final bool isUnlocked;
  final bool isCompleted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          children: [
            Container(
              width: 27,
              height: 27,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.yellow
                    : (isUnlocked
                          ? AppColors.mapItemUnlocked
                          : Colors.transparent),
                shape: BoxShape.circle,
                border: Border.all(
                  color: isActive ? AppColors.ink : AppColors.mapItemBorder,
                ),
              ),
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  color: isUnlocked ? AppColors.ink : AppColors.muted,
                  fontWeight: isActive ? FontWeight.w900 : FontWeight.w500,
                ),
              ),
            ),
            if (isCompleted)
              const Icon(Icons.check_rounded, size: 15, color: AppColors.blue),
          ],
        ),
      ),
    );
  }
}
