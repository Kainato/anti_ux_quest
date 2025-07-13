import 'dart:async';

import 'package:anti_ux_quest/class/keyboard_class.dart';
import 'package:flutter/material.dart';

import '../enum/keyboard_enum.dart';

class HomeController {
  HomeController();
  TextEditingController keyboardTextController = TextEditingController();
  ValueNotifier<List<KeyboardClass>> keyboardsLabels = ValueNotifier([]);
  ScrollPhysics keyboardPhysics = const BouncingScrollPhysics();
  Timer? timer;

  List<MaterialColor> keyboardColors = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.teal,
    Colors.pink,
    Colors.cyan,
    Colors.indigo,
    Colors.amber,
    Colors.lime,
  ];

  void addKeyboardList() {
    // Fase 1 - Alfabeto
    keyboardsLabels.value.addAll(
      'abcdefghijklmnopqrstuvwxyz'.split('').map((char) {
        return KeyboardClass(value: char, type: KeyboardEnum.text);
      }).toList(),
    );
    // Fase 2 - Números
    keyboardsLabels.value.addAll(
      '0123456789'.split('').map((char) {
        return KeyboardClass(value: char, type: KeyboardEnum.number);
      }).toList(),
    );
    // Fase 3 - Símbolos
    keyboardsLabels.value.addAll(
      '!@#\$%^&*()_+-=[]{}|;:,.<>?/'.split('').map((char) {
        return KeyboardClass(value: char, type: KeyboardEnum.symbol);
      }).toList(),
    );
    // Fase 4 - Ações
    keyboardsLabels.value.add(
      KeyboardClass(value: ' ', type: KeyboardEnum.action),
    );
  }
}
