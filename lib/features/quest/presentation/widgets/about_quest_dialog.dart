import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

void showAboutQuestDialog(BuildContext context) {
  showAboutDialog(
    context: context,
    applicationName: 'Anti-UX Quest',
    applicationVersion: '12 fases',
    applicationIcon: const Icon(
      Icons.bolt_rounded,
      color: AppColors.coral,
      size: 36,
    ),
    children: const [
      Text(
        'Um jogo sobre interfaces que testam sua paciência. Complete tarefas simples, enfrente decisões de UI/UX feitas da pior maneira possível e descubra como cada barreira poderia ser evitada.',
      ),
    ],
  );
}
