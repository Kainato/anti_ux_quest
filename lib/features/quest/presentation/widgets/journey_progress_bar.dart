import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class JourneyProgressBar extends StatelessWidget {
  const JourneyProgressBar({
    super.key,
    required this.progress,
    required this.completedLevels,
  });

  final double progress;
  final int completedLevels;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${(progress * 100).round()}% DA JORNADA',
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.4,
                color: AppColors.muted,
              ),
            ),
            Text(
              '$completedLevels concluídas',
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: AppColors.muted,
              ),
            ),
          ],
        ),
        const SizedBox(height: 9),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 7,
            backgroundColor: AppColors.progressTrack,
            color: AppColors.blue,
          ),
        ),
      ],
    );
  }
}
