import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../domain/rules/challenge_rules.dart';
import '../widgets/action_button.dart';
import '../widgets/letter_keyboard.dart';
import 'challenge_actions.dart';

class AlphabeticKeyboardChallenge extends StatefulWidget {
  const AlphabeticKeyboardChallenge({super.key, required this.actions});

  final ChallengeActions actions;

  @override
  State<AlphabeticKeyboardChallenge> createState() =>
      _AlphabeticKeyboardChallengeState();
}

class _AlphabeticKeyboardChallengeState
    extends State<AlphabeticKeyboardChallenge> {
  String _text = '';

  void _submit() {
    if (ChallengeRules.isTargetWord(_text)) {
      widget.actions.onSuccess();
    } else {
      widget.actions.onNotice('Ops, ainda não é “arroz”.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'CAMPO DE TEXTO',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.4,
            color: AppColors.muted,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.paper,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            _text.isEmpty ? 'Toque nas letras abaixo…' : _text,
            style: TextStyle(
              color: _text.isEmpty ? AppColors.muted : AppColors.ink,
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 12),
        LetterKeyboard(
          keyWidth: 34,
          keyHeight: 36,
          spacing: 5,
          runSpacing: 6,
          keyShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          labelStyle: const TextStyle(fontWeight: FontWeight.w800),
          onKeyPressed: (letter) => setState(() => _text += letter),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            TextButton(
              onPressed: () => setState(
                () => _text = _text.isEmpty
                    ? ''
                    : _text.substring(0, _text.length - 1),
              ),
              child: const Text('APAGAR'),
            ),
            const Spacer(),
            ActionButton(label: 'ENVIAR', onPressed: _submit),
          ],
        ),
      ],
    );
  }
}
