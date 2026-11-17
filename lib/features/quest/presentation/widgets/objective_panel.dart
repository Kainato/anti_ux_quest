import 'package:flutter/material.dart';

import '../../../../app/theme/app_palette.dart';

class ObjectivePanel extends StatelessWidget {
  const ObjectivePanel({super.key, required this.objective});

  final String objective;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: palette.surfaceAlt,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.flag_rounded, size: 19, color: palette.accent),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              objective,
              style: TextStyle(
                fontSize: 15,
                height: 1.4,
                fontWeight: FontWeight.w600,
                color: palette.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
