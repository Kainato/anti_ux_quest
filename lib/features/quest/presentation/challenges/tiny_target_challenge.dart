import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../widgets/tiny_target_dot.dart';
import 'challenge_actions.dart';

class TinyTargetChallenge extends StatelessWidget {
  const TinyTargetChallenge({super.key, required this.actions});

  final ChallengeActions actions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            right: 12,
            top: 8,
            child: Text(
              'ENVIAR',
              style: TextStyle(fontSize: 9, color: AppColors.faintLabel),
            ),
          ),
          TinyTargetDot(size: 8, onTap: actions.onSuccess),
        ],
      ),
    );
  }
}
