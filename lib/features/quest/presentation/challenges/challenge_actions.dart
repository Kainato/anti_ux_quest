import 'package:flutter/widgets.dart';

/// Canal pelo qual um desafio avisa o resultado das ações da pessoa jogadora.
class ChallengeActions {
  const ChallengeActions({required this.onSuccess, required this.onNotice});

  final VoidCallback onSuccess;
  final ValueChanged<String> onNotice;
}
