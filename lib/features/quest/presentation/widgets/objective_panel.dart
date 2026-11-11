import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class ObjectivePanel extends StatelessWidget {
  const ObjectivePanel({super.key, required this.objective});

  final String objective;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.objectiveSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.flag_rounded, size: 19, color: AppColors.coral),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              objective,
              style: const TextStyle(
                fontSize: 15,
                height: 1.4,
                fontWeight: FontWeight.w600,
                color: AppColors.ink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
