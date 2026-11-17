import 'package:flutter/material.dart';

import '../../../../app/theme/app_palette.dart';

class QuestDrawer extends StatelessWidget {
  const QuestDrawer({
    super.key,
    required this.onShowLevels,
    required this.onShowAbout,
  });

  final VoidCallback onShowLevels;
  final VoidCallback onShowAbout;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: palette.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.bolt_rounded, color: palette.onPrimary),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'ANTI-UX QUEST',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.6,
                    ),
                  ),
                  Text(
                    'Sobreviva ao design ruim.',
                    style: TextStyle(color: palette.textMuted),
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.sports_esports_rounded),
              title: const Text('Jogar'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.map_rounded),
              title: const Text('Mapa de fases'),
              onTap: () {
                Navigator.pop(context);
                onShowLevels();
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline_rounded),
              title: const Text('Sobre o projeto'),
              onTap: () {
                Navigator.pop(context);
                onShowAbout();
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Text(
                'Feito para aprender por contraste.\n12 fases • 12 decisões questionáveis',
                style: TextStyle(
                  color: palette.textMuted,
                  fontSize: 12,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
