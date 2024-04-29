import 'package:flutter/material.dart';

import '../../../extensions/duration_extensions.dart';
import '../../../extensions/pacing_extensions.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/pacing_model.dart';

class PacingPersistentHeader extends SliverPersistentHeaderDelegate {
  static const double height = 40;
  final PacingModel pacing;

  PacingPersistentHeader({
    required this.pacing,
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
      color: Theme.of(context).colorScheme.background,
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              S.of(context).improvisationCount(pacing.improvisations.length),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${S.of(context).duration}: ${pacing.totalDuration().toImprovDuration()}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
