import 'package:flutter/material.dart';

import '../../domain/rules/challenge_rules.dart';
import '../widgets/action_button.dart';
import 'challenge_actions.dart';

class ConfirmationChainChallenge extends StatefulWidget {
  const ConfirmationChainChallenge({super.key, required this.actions});

  final ChallengeActions actions;

  @override
  State<ConfirmationChainChallenge> createState() =>
      _ConfirmationChainChallengeState();
}

class _ConfirmationChainChallengeState
    extends State<ConfirmationChainChallenge> {
  int _confirmations = 0;

  void _confirm() {
    setState(() => _confirmations++);
    if (_confirmations >= ChallengeRules.confirmationChainSteps) {
      widget.actions.onSuccess();
    } else {
      widget.actions.onNotice(
        'Confirmação $_confirmations de ${ChallengeRules.confirmationChainSteps}. Ufa.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Você tem certeza? ${_confirmations > 0 ? 'Tem certeza mesmo?' : ''}',
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 14),
        ActionButton(
          label: _confirmations == 0 ? 'SIM, CONTINUAR' : 'SIM, TENHO CERTEZA',
          onPressed: _confirm,
        ),
      ],
    );
  }
}
