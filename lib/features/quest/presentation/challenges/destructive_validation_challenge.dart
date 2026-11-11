import 'package:flutter/material.dart';

import '../../domain/rules/challenge_rules.dart';
import '../widgets/action_button.dart';
import '../widgets/filled_input_decoration.dart';
import 'challenge_actions.dart';

class DestructiveValidationChallenge extends StatefulWidget {
  const DestructiveValidationChallenge({super.key, required this.actions});

  final ChallengeActions actions;

  @override
  State<DestructiveValidationChallenge> createState() =>
      _DestructiveValidationChallengeState();
}

class _DestructiveValidationChallengeState
    extends State<DestructiveValidationChallenge> {
  final _controller = TextEditingController();

  void _submit() {
    if (ChallengeRules.isTargetWord(_controller.text)) {
      widget.actions.onSuccess();
      return;
    }
    _controller.clear();
    widget.actions.onNotice(
      'Incorreto! Apagamos tudo para você começar de novo.',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: filledInputDecoration(labelText: 'Palavra secreta'),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: ActionButton(label: 'ENVIAR', onPressed: _submit),
        ),
      ],
    );
  }
}
