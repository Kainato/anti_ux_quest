import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../challenges/challenge_actions.dart';
import '../challenges/challenge_factory.dart';
import '../controllers/quest_controller.dart';
import 'brand_header.dart';
import 'challenge_panel.dart';
import 'journey_progress_bar.dart';
import 'objective_panel.dart';
import 'reflection_panel.dart';

class QuestContent extends StatelessWidget {
  const QuestContent({super.key, required this.controller});

  final QuestController controller;

  @override
  Widget build(BuildContext context) {
    final level = controller.currentLevel;
    final levelNumber = (controller.currentIndex + 1).toString().padLeft(
      2,
      '0',
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BrandHeader(),
        const SizedBox(height: 26),
        JourneyProgressBar(
          progress: controller.journeyProgress,
          completedLevels: controller.completedLevels,
        ),
        const SizedBox(height: 30),
        Text(
          'DESAFIO $levelNumber',
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
            color: AppColors.blue,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          level.title,
          style: const TextStyle(
            fontSize: 31,
            height: 1.08,
            fontWeight: FontWeight.w900,
            color: AppColors.ink,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 12),
        ObjectivePanel(objective: level.objective),
        const SizedBox(height: 24),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 240),
          child: controller.isLevelComplete
              ? ReflectionPanel(
                  key: const ValueKey('reflection'),
                  pattern: level.pattern,
                  reflection: level.reflection,
                  isLastLevel: controller.isLastLevel,
                  onContinue: controller.advance,
                )
              : ChallengePanel(
                  key: ValueKey(
                    'challenge-${controller.currentIndex}-${controller.attempt}',
                  ),
                  child: buildChallenge(
                    level.challenge,
                    ChallengeActions(
                      onSuccess: controller.completeCurrentLevel,
                      onNotice: controller.showNotice,
                    ),
                  ),
                ),
        ),
        if (controller.notice.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            controller.notice,
            style: const TextStyle(
              color: AppColors.coral,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
        const SizedBox(height: 18),
        const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: AppColors.coral, size: 16),
            SizedBox(width: 6),
            Expanded(
              child: Text(
                'Prática ruim em jogo. A dificuldade deve ser irritante, nunca impossível.',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.muted,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
