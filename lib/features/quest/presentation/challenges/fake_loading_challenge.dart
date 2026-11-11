import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../widgets/action_button.dart';
import 'challenge_actions.dart';

class FakeLoadingChallenge extends StatefulWidget {
  const FakeLoadingChallenge({super.key, required this.actions});

  final ChallengeActions actions;

  @override
  State<FakeLoadingChallenge> createState() => _FakeLoadingChallengeState();
}

class _FakeLoadingChallengeState extends State<FakeLoadingChallenge> {
  bool _sent = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: _sent ? 1 : .99,
            minHeight: 12,
            color: AppColors.coral,
            backgroundColor: AppColors.loadingTrack,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          _sent ? 'Pronto! Levou só um instante (mentira).' : 'Enviando… 99%',
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 14),
        if (_sent)
          ActionButton(label: 'CONCLUIR', onPressed: widget.actions.onSuccess)
        else
          TextButton(
            onPressed: () => setState(() => _sent = true),
            child: const Text('AINDA ESTÁ AÍ? TOQUE AQUI'),
          ),
      ],
    );
  }
}
