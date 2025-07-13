import 'package:anti_ux_quest/home_page.dart';
import 'package:flutter/material.dart';

class CoreMaterial extends StatefulWidget {
  const CoreMaterial({super.key});

  @override
  State<CoreMaterial> createState() => _CoreMaterialState();
}

class _CoreMaterialState extends State<CoreMaterial> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
