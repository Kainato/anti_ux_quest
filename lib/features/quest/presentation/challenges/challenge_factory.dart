import 'package:flutter/widgets.dart';

import '../../domain/entities/challenge_type.dart';
import 'alphabetic_keyboard_challenge.dart';
import 'ambiguous_input_challenge.dart';
import 'challenge_actions.dart';
import 'confirmation_chain_challenge.dart';
import 'destructive_validation_challenge.dart';
import 'duplicate_options_challenge.dart';
import 'fake_loading_challenge.dart';
import 'final_combo_challenge.dart';
import 'low_contrast_challenge.dart';
import 'moving_button_challenge.dart';
import 'password_challenge.dart';
import 'scroll_trap_challenge.dart';
import 'tiny_target_challenge.dart';

/// Único ponto que associa um [ChallengeType] ao widget que o implementa.
Widget buildChallenge(ChallengeType type, ChallengeActions actions) {
  return switch (type) {
    ChallengeType.alphabeticKeyboard => AlphabeticKeyboardChallenge(
      actions: actions,
    ),
    ChallengeType.movingButton => MovingButtonChallenge(actions: actions),
    ChallengeType.ambiguousInput => AmbiguousInputChallenge(actions: actions),
    ChallengeType.destructiveValidation => DestructiveValidationChallenge(
      actions: actions,
    ),
    ChallengeType.tinyTarget => TinyTargetChallenge(actions: actions),
    ChallengeType.lowContrast => LowContrastChallenge(actions: actions),
    ChallengeType.duplicateOptions => DuplicateOptionsChallenge(
      actions: actions,
    ),
    ChallengeType.confirmationChain => ConfirmationChainChallenge(
      actions: actions,
    ),
    ChallengeType.scrollTrap => ScrollTrapChallenge(actions: actions),
    ChallengeType.passwordChallenge => PasswordChallenge(actions: actions),
    ChallengeType.fakeLoading => FakeLoadingChallenge(actions: actions),
    ChallengeType.finalCombo => FinalComboChallenge(actions: actions),
  };
}
