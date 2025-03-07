import 'package:flutter/material.dart';

import '../../models/theme_type.dart';

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
    return SliverAppBar.large(
      primary: primary,
      leading:
          canPop
              ? const BackButton()
              : Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset(
                  switch (theme) {
                    ThemeType.dark => 'assets/MonPacingDark.png',
                    ThemeType.light => 'assets/MonPacingLight.png',
                    ThemeType.lni => 'assets/MonPacingLNI.png',
                  },
                  filterQuality: FilterQuality.high,
                  errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                  isAntiAlias: true,
                ),
              ),
      title: Text(title, maxLines: 2, overflow: TextOverflow.ellipsis),
      centerTitle: true,
      actions: actions,
    );
  }
}
