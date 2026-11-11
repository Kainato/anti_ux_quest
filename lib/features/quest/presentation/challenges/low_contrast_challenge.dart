import 'package:flutter/material.dart';

import '../../../../app/theme/app_palette.dart';
import '../../domain/rules/challenge_rules.dart';
import 'challenge_actions.dart';

class LowContrastChallenge extends StatelessWidget {
  const LowContrastChallenge({super.key, required this.actions});

  static const _answers = ['Verde', 'Azul', 'Roxo'];

  final ChallengeActions actions;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Column(
      children: [
        Text(
          'A instrução está aqui, mas quase não dá para ler.',
          style: TextStyle(color: palette.faintText, fontSize: 12),
        ),
        const SizedBox(height: 18),
        Text(
          'Qual é a cor do céu em um dia sem nuvens?',
          style: TextStyle(color: palette.fainterText, fontSize: 13),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          children: [
            for (final answer in _answers)
              OutlinedButton(
                onPressed: () => ChallengeRules.isCorrectSkyColor(answer)
                    ? actions.onSuccess()
                    : actions.onNotice('Resposta incorreta. Tente de novo.'),
                child: Text(answer),
              ),
          ],
        ),
      ],
    );
  }
}
