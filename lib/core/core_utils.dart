import 'package:flutter/material.dart';

class CoreUtils {
  static late double width;

  static void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
  }
}
