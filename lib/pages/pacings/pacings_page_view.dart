import 'package:flutter/material.dart';

import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../l10n/app_localizations.dart';

class PacingsPageView extends StatelessWidget {
  const PacingsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverScaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: S.of(context).createNewPacingTooltip,
        child: const Icon(Icons.add),
      ),
      slivers: [
        SliverLogoAppbar(
          title: S.of(context).pacings,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                icon: const Icon(Icons.download),
                tooltip: S.of(context).importPacingTooltip,
                onPressed: () {},
              ),
            )
          ],
        ),
        SliverList.builder(
          itemBuilder: (context, index) {
            return ListTile(title: Text(index.toString()));
          },
        )
      ],
    );
  }
}
