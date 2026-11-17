import 'package:flutter/material.dart';

import '../widgets/action_button.dart';
import 'challenge_actions.dart';

class DuplicateOptionsChallenge extends StatefulWidget {
  const DuplicateOptionsChallenge({super.key, required this.actions});

  final ChallengeActions actions;

  @override
  State<DuplicateOptionsChallenge> createState() =>
      _DuplicateOptionsChallengeState();
}

class _DuplicateOptionsChallengeState extends State<DuplicateOptionsChallenge> {
  static const _options = [
    (value: 'first', label: 'Concordo'),
    (value: 'second', label: 'Concordo'),
    (value: 'decline', label: 'Não concordo'),
  ];
  static const _correctValue = 'second';

  String? _choice;

  void _select(String? value) => setState(() => _choice = value);

  void _submit() {
    if (_choice == _correctValue) {
      widget.actions.onSuccess();
    } else {
      widget.actions.onNotice('Escolha a segunda opção “Concordo”.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioGroup<String>(
          groupValue: _choice,
          onChanged: _select,
          child: Column(
            children: [
              for (final option in _options)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Radio<String>(value: option.value),
                  title: Text(option.label),
                  onTap: () => _select(option.value),
                ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ActionButton(label: 'SEGUIR', onPressed: _submit),
        ),
      ],
    );
  }
}
