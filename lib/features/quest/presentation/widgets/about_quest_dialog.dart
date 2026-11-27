import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app/theme/app_palette.dart';

const _privacyPolicyUrl =
    'https://kainato.github.io/anti_ux_quest/privacy-policy.html';

Future<void> openPrivacyPolicy(BuildContext context) async {
  final uri = Uri.parse(_privacyPolicyUrl);
  final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
  if (!context.mounted || launched) {
    return;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Nao foi possivel abrir a Politica de Privacidade.'),
    ),
  );
}

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
    children: [
      const Text(
        'Um jogo sobre interfaces que testam sua paciencia. Complete tarefas simples, enfrente decisoes de UI/UX feitas da pior maneira possivel e descubra como cada barreira poderia ser evitada.',
      ),
      const SizedBox(height: 12),
      TextButton.icon(
        onPressed: () => openPrivacyPolicy(context),
        icon: const Icon(Icons.privacy_tip_outlined),
        label: const Text('Politica de Privacidade'),
      ),
    ],
  );
}
