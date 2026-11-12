import 'package:flutter/material.dart';

import '../../../../app/theme/app_palette.dart';

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: palette.primary,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Icon(Icons.bolt_rounded, color: palette.onPrimary),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ANTI-UX QUEST',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
                color: palette.textMuted,
              ),
            ),
            Text(
              'Uma tarefa. Uma péssima interface.',
              style: TextStyle(fontSize: 12, color: palette.textMuted),
            ),
          ],
        ),
      ],
    );
  }
}
