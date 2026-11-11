/// Regras de vitória das fases, independentes de UI.
abstract final class ChallengeRules {
  static const targetWord = 'arroz';
  static const identifierLength = 8;
  static const minPasswordLength = 8;
  static const passwordRequiredFragment = 'ux';
  static const skyColorAnswer = 'Azul';

  /// Posição do botão fugitivo a partir da qual ele finalmente aceita o toque.
  static const movingButtonFinalSlot = 5;
  static const confirmationChainSteps = 3;
  static const finalComboConfirmations = 2;

  static bool isTargetWord(String input) => input.toLowerCase() == targetWord;

  static bool isValidIdentifier(String input) =>
      input.replaceAll(RegExp(r'\D'), '').length == identifierLength;

  static bool meetsPasswordRequirements(String password) =>
      password.length >= minPasswordLength &&
      password.toLowerCase().contains(passwordRequiredFragment);

  static bool isCorrectSkyColor(String answer) => answer == skyColorAnswer;
}
