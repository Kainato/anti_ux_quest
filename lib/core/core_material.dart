import 'package:anti_ux_quest/pages/home_page.dart';
import 'package:flutter/material.dart';

class CoreMaterial extends StatelessWidget {
  const CoreMaterial({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anti-UX Quest',
      home: const HomePage(),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F1E8),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF536CF4),
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
      ),
    );
  }
}
