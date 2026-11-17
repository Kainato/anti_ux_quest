import 'package:flutter/material.dart';

import '../widgets/action_button.dart';
import 'challenge_actions.dart';

class ScrollTrapChallenge extends StatelessWidget {
  const ScrollTrapChallenge({super.key, required this.actions});

  static const _preferences = [
    'Avisos por e-mail',
    'Atualizações do produto',
    'Lembretes semanais',
    'Novidades e ofertas',
    'Resumo mensal',
    'Relatórios de uso',
    'Preferências extras',
  ];

  final ChallengeActions actions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 285,
      child: ListView(
        children: [
          const Text(
            'Preferências da conta',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
          ),
          const SizedBox(height: 10),
          for (final preference in _preferences)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.tune_rounded, size: 19),
              title: Text(preference),
              trailing: const Icon(Icons.chevron_right_rounded),
            ),
          const SizedBox(height: 6),
          ActionButton(
            label: 'FINALMENTE, CONTINUAR',
            onPressed: actions.onSuccess,
          ),
        ],
      ),
    );
  }
}
