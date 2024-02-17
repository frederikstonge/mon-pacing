import 'package:flutter/material.dart';

import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../l10n/app_localizations.dart';

class SettingsPageView extends StatelessWidget {
  const SettingsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverScaffold(
      appBar: SliverAppBar.large(
        title: Text(S.of(context).settings),
      ),
      slivers: [
        SliverList.builder(itemBuilder: (context, index) {
          return ListTile(title: Text(index.toString()));
        })
      ],
    );
  }
}
