import 'package:flutter/material.dart';

import '../../../../app/theme/app_palette.dart';

InputDecoration filledInputDecoration(
  BuildContext context, {
  required String labelText,
  String? hintText,
  String? helperText,
}) {
  return InputDecoration(
    labelText: labelText,
    hintText: hintText,
    helperText: helperText,
    filled: true,
    fillColor: context.palette.background,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  );
}
