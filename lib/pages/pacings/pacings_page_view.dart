import 'package:flutter/material.dart';

import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../l10n/app_localizations.dart';

class PacingsPageView extends StatelessWidget {
  const PacingsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverScaffold(
      appBar: SliverAppBar.large(
        title: Text(S.of(context).pacings),
      ),
      slivers: [
        SliverList.builder(itemBuilder: (context, index) {
          return ListTile(title: Text(index.toString()));
        })
      ],
    );
  }
}
