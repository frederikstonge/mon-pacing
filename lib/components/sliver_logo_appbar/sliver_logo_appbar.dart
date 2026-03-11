import 'package:flutter/material.dart';

import '../../models/theme_type.dart';
import 'logo.dart';

class SliverLogoAppbar extends StatelessWidget {
  static const toolbarHeight = kToolbarHeight + 8;

  final String title;
  final ThemeType theme;
  final List<Widget>? actions;
  final bool primary;

  const SliverLogoAppbar({super.key, required this.title, required this.theme, this.primary = true, this.actions});

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();
    return SliverAppBar(
      pinned: true,
      primary: primary,
      leading: canPop
          ? const BackButton()
          : Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Logo(theme: theme),
            ),
      title: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      centerTitle: true,
      actions: actions,
    );
  }
}
