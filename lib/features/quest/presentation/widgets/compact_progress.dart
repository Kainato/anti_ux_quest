import 'package:flutter/material.dart';

import '../../../../app/theme/app_palette.dart';
import '../controllers/quest_controller.dart';

class CompactProgress extends StatelessWidget {
  const CompactProgress({super.key, required this.controller});

  final QuestController controller;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Row(
      children: [
        for (var i = 0; i < controller.levels.length; i++)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: GestureDetector(
                onTap: () => controller.openLevel(i),
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: controller.canOpen(i)
                        ? (i == controller.currentIndex
                              ? palette.accent
                              : palette.primary)
                        : palette.progressTrackLocked,
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
