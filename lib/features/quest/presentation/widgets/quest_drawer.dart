import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

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
    return Drawer(
      backgroundColor: AppColors.paper,
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
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(Icons.bolt_rounded),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'ANTI-UX QUEST',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.6,
                    ),
                  ),
                  const Text(
                    'Sobreviva ao design ruim.',
                    style: TextStyle(color: AppColors.muted),
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
            const Padding(
              padding: EdgeInsets.all(22),
              child: Text(
                'Feito para aprender por contraste.\n12 fases • 12 decisões questionáveis',
                style: TextStyle(
                  color: AppColors.muted,
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
