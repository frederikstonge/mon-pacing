import 'package:flutter/material.dart';

import '../../components/custom_card/custom_card.dart';
import '../../components/settings_tile/settings_tile.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../components/text_header/text_header.dart';
import '../../l10n/app_localizations.dart';

class SettingsPageView extends StatelessWidget {
  const SettingsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverScaffold(
      slivers: [
        SliverLogoAppbar(title: S.of(context).settings),
        SliverList.list(
          children: [
            CustomCard(
              child: Column(
                children: [
                  const TextHeader(title: 'General'),
                  SettingsTile(
                    leading: const Icon(Icons.language),
                    title: 'Language',
                    subTitle: 'English',
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  SettingsTile(
                    leading: const Icon(Icons.color_lens),
                    title: 'Theme',
                    subTitle: 'Light',
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  SettingsTile(
                    leading: const Icon(Icons.timer),
                    title: 'Enable padding duration',
                    subTitle: 'Extra time to take into account for each improvisation',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
