import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../domain/rules/challenge_rules.dart';
import '../widgets/action_button.dart';
import '../widgets/filled_input_decoration.dart';
import 'challenge_actions.dart';

class PasswordChallenge extends StatefulWidget {
  const PasswordChallenge({super.key, required this.actions});

  final ChallengeActions actions;

  @override
  State<PasswordChallenge> createState() => _PasswordChallengeState();
}

class _PasswordChallengeState extends State<PasswordChallenge> {
  String _password = '';
  bool _requirementsRevealed = false;

  void _submit() {
    if (!_requirementsRevealed) {
      setState(() => _requirementsRevealed = true);
      widget.actions.onNotice('A senha não atende aos requisitos.');
    } else if (ChallengeRules.meetsPasswordRequirements(_password)) {
      widget.actions.onSuccess();
    } else {
      widget.actions.onNotice(
        'Tente de novo. Não apagamos sua senha desta vez.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          obscureText: true,
          onChanged: (value) => _password = value,
          decoration: filledInputDecoration(labelText: 'Nova senha'),
        ),
        if (_requirementsRevealed)
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Surpresa! A senha precisa ter ao menos 8 caracteres e incluir “ux”.',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.coral,
                height: 1.4,
              ),
            ),
          ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: ActionButton(label: 'CRIAR CONTA', onPressed: _submit),
        ),
      ],
    );
  }
}
