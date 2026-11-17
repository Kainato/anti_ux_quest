import 'package:flutter/material.dart';

import '../../../../app/theme/app_palette.dart';

void showAboutQuestDialog(BuildContext context) {
  showAboutDialog(
    context: context,
    applicationName: 'Anti-UX Quest',
    applicationVersion: '12 fases',
    applicationIcon: Icon(
      Icons.bolt_rounded,
      color: context.palette.primary,
      size: 36,
    ),
    children: const [
      Text(
        'Um jogo sobre interfaces que testam sua paciência. Complete tarefas simples, enfrente decisões de UI/UX feitas da pior maneira possível e descubra como cada barreira poderia ser evitada.',
      ),
    ],
  );
}
