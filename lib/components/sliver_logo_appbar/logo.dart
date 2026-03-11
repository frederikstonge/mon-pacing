import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../models/theme_type.dart';
import '../message_box_dialog/message_box_dialog.dart';

class Logo extends StatelessWidget {
  final ThemeType theme;

  const Logo({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: switch (theme) {
        ThemeType.ligmaLight || ThemeType.ligmaDark => () => MessageBoxDialog.alertShow(
          context,
          S.of(context).ligmaEasterEgg,
          S.of(context).close,
        ),
        ThemeType.boldor => () => launchUrl(Uri.parse('https://www.facebook.com/boldordimprovisation')),
        ThemeType.evenementCulturel => () => launchUrl(Uri.parse('https://www.facebook.com/evenementcultu')),
        ThemeType.paradoxe => () => launchUrl(Uri.parse('https://www.facebook.com/ImproParadoxe')),
        _ => null,
      },
      child: Image.asset(
        switch (theme) {
          ThemeType.dark => 'assets/MonPacingDark.png',
          ThemeType.light => 'assets/MonPacingLight.png',
          ThemeType.lni => 'assets/MonPacingLNI.png',
          ThemeType.ligmaLight => 'assets/Ligma.png',
          ThemeType.ligmaDark => 'assets/Ligma.png',
          ThemeType.boldor => 'assets/Boldor.png',
          ThemeType.evenementCulturel => 'assets/EC.png',
          ThemeType.paradoxe => 'assets/Paradoxe.png',
        },
        filterQuality: FilterQuality.high,
        errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
        isAntiAlias: true,
      ),
    );
  }
}
