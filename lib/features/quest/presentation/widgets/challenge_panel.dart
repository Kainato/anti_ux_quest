import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class ChallengePanel extends StatelessWidget {
  const ChallengePanel({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 15,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }
}
