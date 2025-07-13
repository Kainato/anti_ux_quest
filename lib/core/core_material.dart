import 'package:anti_ux_quest/core/core_utils.dart';
import 'package:anti_ux_quest/pages/home_page.dart';
import 'package:flutter/material.dart';

class CoreMaterial extends StatefulWidget {
  const CoreMaterial({super.key});

  @override
  State<CoreMaterial> createState() => _CoreMaterialState();
}

class _CoreMaterialState extends State<CoreMaterial> {
  @override
  Widget build(BuildContext context) {
    CoreUtils.init(context);
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(useMaterial3: false),
      darkTheme: ThemeData.dark(useMaterial3: false),
      themeMode: ThemeMode.dark,
    );
  }
}
