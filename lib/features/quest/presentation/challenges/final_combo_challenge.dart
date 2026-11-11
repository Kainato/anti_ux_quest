import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../domain/rules/challenge_rules.dart';
import '../widgets/action_button.dart';
import '../widgets/letter_keyboard.dart';
import '../widgets/tiny_target_dot.dart';
import 'challenge_actions.dart';

class FinalComboChallenge extends StatefulWidget {
  const FinalComboChallenge({super.key, required this.actions});

  final ChallengeActions actions;

  @override
  State<FinalComboChallenge> createState() => _FinalComboChallengeState();
}

class _FinalComboChallengeState extends State<FinalComboChallenge> {
  String _text = '';
  bool _targetHit = false;
  int _confirmations = 0;

  void _hitTarget() {
    if (ChallengeRules.isTargetWord(_text)) {
      setState(() => _targetHit = true);
    } else {
      widget.actions.onNotice('Primeiro escreva arroz.');
    }
  }

  void _confirm() {
    setState(() => _confirmations++);
    if (_confirmations >= ChallengeRules.finalComboConfirmations) {
      widget.actions.onSuccess();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '1. Escreva “arroz” no teclado em ordem alfabética.',
          style: TextStyle(fontSize: 12, height: 1.4),
        ),
        const SizedBox(height: 8),
        LetterKeyboard(
          keyWidth: 27,
          keyHeight: 32,
          spacing: 4,
          runSpacing: 5,
          onKeyPressed: (letter) => setState(() => _text += letter),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            _text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
        ),
        const Divider(),
        const Text(
          '2. Acerte o alvo minúsculo.',
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(
          height: 43,
          child: Align(
            alignment: Alignment.centerRight,
            child: TinyTargetDot(size: 9, onTap: _hitTarget),
          ),
        ),
        const Divider(),
        if (_targetHit)
          ActionButton(
            label: _confirmations == 0 ? 'CONFIRMAR' : 'CONFIRMAR DE NOVO',
            onPressed: _confirm,
          )
        else
          const Text(
            'Envie as duas etapas para liberar o botão.',
            style: TextStyle(color: AppColors.muted, fontSize: 11),
          ),
      ],
    );
  }
}
