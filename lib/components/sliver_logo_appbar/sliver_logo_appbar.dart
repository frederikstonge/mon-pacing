import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../actions/loading_icon_button.dart';

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
          ? LoadingIconButton(
              icon: Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).maybePop();
              })
          : Padding(
              padding: const EdgeInsets.only(left: 16),
              child: SizedBox(
                height: toolbarHeight,
                width: logoWidth,
                child: Column(
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
              ),
            ),
      title: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      centerTitle: true,
      actions: actions,
    );
  }
}
