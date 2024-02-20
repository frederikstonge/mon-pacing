import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/settings/settings_state.dart';
import '../../models/theme_type.dart';

class SliverLogoAppbar extends StatefulWidget {
  final String title;
  final double expandedHeight;

  const SliverLogoAppbar({
    super.key,
    required this.title,
    this.expandedHeight = 112,
  });

  @override
  State<SliverLogoAppbar> createState() => _SliverLogoAppbarState();
}

class _SliverLogoAppbarState extends State<SliverLogoAppbar> with TickerProviderStateMixin {
  static const toolbarHeight = kToolbarHeight + 8;
  static const logoWidth = 110.0;
  late final AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.medium(
      leadingWidth: logoWidth,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: SizedBox(
          height: toolbarHeight,
          width: logoWidth,
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) => switch (state.theme) {
              ThemeType.lni => Image.asset(
                  'assets/lni-logo.png',
                  fit: BoxFit.contain,
                ),
              _ => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Mon',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              letterSpacing: -2,
                            ),
                        children: [
                          TextSpan(
                            text: 'Pacing',
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -1,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            },
          ),
        ),
      ),
      title: Text(widget.title),
      centerTitle: true,
      expandedHeight: widget.expandedHeight,
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        final opacity = (constraints.maxHeight - toolbarHeight) / toolbarHeight;
        animationController.value = opacity;
        return FadeTransition(
          opacity: animationController,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ),
        );
      }),
    );
  }
}
