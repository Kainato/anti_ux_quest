import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

InputDecoration filledInputDecoration({
  required String labelText,
  String? hintText,
  String? helperText,
}) {
  return InputDecoration(
    labelText: labelText,
    hintText: hintText,
    helperText: helperText,
    filled: true,
    fillColor: AppColors.paper,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  );
}
