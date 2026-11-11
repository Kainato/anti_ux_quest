import 'package:flutter/material.dart';

import '../../../../app/theme/app_palette.dart';
import '../../domain/rules/challenge_rules.dart';
import 'challenge_actions.dart';

class MovingButtonChallenge extends StatefulWidget {
  const MovingButtonChallenge({super.key, required this.actions});

  final ChallengeActions actions;

  @override
  State<MovingButtonChallenge> createState() => _MovingButtonChallengeState();
}

class _MovingButtonChallengeState extends State<MovingButtonChallenge> {
  static const _labels = ['ENVIAR', 'CONFIRMAR', 'PRONTO', 'CONTINUAR'];

  int _slot = 0;

  void _onPressed() {
    if (_slot >= ChallengeRules.movingButtonFinalSlot) {
      widget.actions.onSuccess();
      return;
    }
    setState(() => _slot++);
    widget.actions.onNotice('Quase! O botão mudou de lugar.');
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Column(
      children: [
        SizedBox(
          height: 120,
          width: double.infinity,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 180),
                left: (_slot % 3) * 100.0,
                top: (_slot ~/ 3) * 55.0,
                child: FilledButton(
                  onPressed: _onPressed,
                  style:
                      FilledButton.styleFrom(
                        backgroundColor: palette.accent,
                        foregroundColor: palette.onPrimary,
                      ).copyWith(
                        mouseCursor: const WidgetStatePropertyAll(
                          SystemMouseCursors.click,
                        ),
                      ),
                  child: Text(_labels[_slot % _labels.length]),
                ),
              ),
            ],
          ),
        ),
        Text(
          'Dica: a persistência também é uma estratégia.',
          style: TextStyle(fontSize: 12, color: palette.textMuted),
        ),
      ],
    );
  }
}
