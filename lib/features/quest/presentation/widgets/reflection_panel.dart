import 'package:flutter/material.dart';

import '../../../../app/theme/app_palette.dart';

class ReflectionPanel extends StatelessWidget {
  const ReflectionPanel({
    super.key,
    required this.pattern,
    required this.reflection,
    required this.isLastLevel,
    required this.onContinue,
  });

  final String pattern;
  final String reflection;
  final bool isLastLevel;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: palette.successSurface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: palette.successBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.check_circle_rounded, color: palette.success),
              const SizedBox(width: 8),
              const Text(
                'FASE CONCLUÍDA',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.4,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            pattern.toUpperCase(),
            style: TextStyle(
              color: palette.primary,
              fontWeight: FontWeight.w900,
              fontSize: 11,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 9),
          Text(reflection, style: const TextStyle(fontSize: 14, height: 1.5)),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: onContinue,
              icon: Icon(
                isLastLevel
                    ? Icons.replay_rounded
                    : Icons.arrow_forward_rounded,
              ),
              label: Text(isLastLevel ? 'JOGAR DE NOVO' : 'PRÓXIMA FASE'),
              style: FilledButton.styleFrom(
                backgroundColor: palette.primary,
                foregroundColor: palette.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
