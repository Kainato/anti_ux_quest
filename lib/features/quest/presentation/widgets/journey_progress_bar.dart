import 'package:flutter/material.dart';

import '../../../../app/theme/app_palette.dart';

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
    final palette = context.palette;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${(progress * 100).round()}% DA JORNADA',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.4,
                color: palette.textMuted,
              ),
            ),
            Text(
              '$completedLevels concluídas',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: palette.textMuted,
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
            backgroundColor: palette.progressTrack,
            color: palette.primary,
          ),
        ),
      ],
    );
  }
}
