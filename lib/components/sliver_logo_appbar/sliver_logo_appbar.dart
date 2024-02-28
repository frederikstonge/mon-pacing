import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/settings/settings_state.dart';
import '../../models/theme_type.dart';

class SliverLogoAppbar extends StatelessWidget {
  static const toolbarHeight = kToolbarHeight + 8;
  static const logoWidth = 110.0;

  final String title;
  final List<Widget>? actions;

  const SliverLogoAppbar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final canPop = GoRouter.of(context).canPop();
    return SliverAppBar.large(
      leadingWidth: canPop ? null : logoWidth,
      leading: canPop
          ? null
          : Padding(
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
      title: Text(title),
      centerTitle: true,
      actions: actions,
    );
  }
}
