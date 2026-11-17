import 'package:flutter/material.dart';

import '../../../../app/theme/app_palette.dart';

class TinyTargetDot extends StatelessWidget {
  const TinyTargetDot({super.key, required this.size, required this.onTap});

  final double size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: context.palette.accent,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
