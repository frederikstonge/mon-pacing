import 'dart:async';

import 'package:flutter/material.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../../models/match_model.dart';

class MatchPersistentHeader extends SliverPersistentHeaderDelegate {
  static const double height = 60;
  final MatchModel match;
  final int selectedImprovisationIndex;
  final void Function(int page) changePage;
  final FutureOr<void> Function()? onAdd;

  MatchPersistentHeader({
    required this.match,
    required this.selectedImprovisationIndex,
    required this.changePage,
    required this.onAdd,
  });

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      alignment: Alignment.topCenter,
      color: Theme.of(context).colorScheme.surface,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...match.improvisations.asMap().entries.map((improvisation) {
            return Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 3.0),
              child: InkWell(
                onTap: () {
                  changePage(improvisation.key);
                },
                child: Card(
                  margin: EdgeInsets.zero,
                  color: improvisation.key == selectedImprovisationIndex ? Theme.of(context).primaryColor : null,
                  child: SizedBox(
                    width: 50,
                    child: Center(
                      child: Text(
                        '${improvisation.key + 1}',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: improvisation.key == selectedImprovisationIndex
                              ? Theme.of(context).colorScheme.onPrimary
                              : null,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
          if (onAdd != null) ...[
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 3.0),
              child: InkWell(
                onTap: onAdd,
                child: Card(
                  margin: EdgeInsets.zero,
                  color: Theme.of(context).colorScheme.secondary,
                  child: SizedBox(
                    width: 50,
                    height: 60,
                    child: Tooltip(
                      message: S.of(context).addImprovisation,
                      child: Center(child: Icon(Icons.add, color: Theme.of(context).colorScheme.onSecondary)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
