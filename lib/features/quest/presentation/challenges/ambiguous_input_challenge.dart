import 'package:flutter/material.dart';

import '../../domain/rules/challenge_rules.dart';
import '../widgets/action_button.dart';
import '../widgets/filled_input_decoration.dart';
import 'challenge_actions.dart';

class AmbiguousInputChallenge extends StatefulWidget {
  const AmbiguousInputChallenge({super.key, required this.actions});

  final ChallengeActions actions;

  @override
  State<AmbiguousInputChallenge> createState() =>
      _AmbiguousInputChallengeState();
}

class _AmbiguousInputChallengeState extends State<AmbiguousInputChallenge> {
  String _value = '';

  void _validate() {
    if (ChallengeRules.isValidIdentifier(_value)) {
      widget.actions.onSuccess();
    } else {
      widget.actions.onNotice('Formato inválido. Tente 8 números.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          keyboardType: TextInputType.number,
          onChanged: (value) => _value = value,
          decoration: filledInputDecoration(
            context,
            labelText: 'Identificador',
            hintText: '________',
            helperText: 'Não vamos dizer o formato. Boa sorte.',
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: ActionButton(label: 'VALIDAR', onPressed: _validate),
        ),
      ],
    );
  }
}
