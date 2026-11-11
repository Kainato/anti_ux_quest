import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class LetterKeyboard extends StatelessWidget {
  const LetterKeyboard({
    super.key,
    required this.onKeyPressed,
    required this.keyWidth,
    required this.keyHeight,
    required this.spacing,
    required this.runSpacing,
    this.keyShape,
    this.labelStyle,
  });

  static const _letters = 'abcdefghijklmnopqrstuvwxyz';

  final ValueChanged<String> onKeyPressed;
  final double keyWidth;
  final double keyHeight;
  final double spacing;
  final double runSpacing;
  final OutlinedBorder? keyShape;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: [
        for (final letter in _letters.split(''))
          SizedBox(
            width: keyWidth,
            height: keyHeight,
            child: FilledButton(
              onPressed: () => onKeyPressed(letter),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.keyBackground,
                foregroundColor: AppColors.ink,
                padding: EdgeInsets.zero,
                shape: keyShape,
              ),
              child: Text(letter, style: labelStyle),
            ),
          ),
      ],
    );
  }
}
