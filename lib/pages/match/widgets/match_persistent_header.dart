import 'dart:async';

import 'package:material_ui/material_ui.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../../models/match_model.dart';

class MatchPersistentHeader extends SliverPersistentHeaderDelegate {
  static const double height = 48;
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
    final count = match.improvisations.length + (match.enableStatistics ? 1 : 0);
    final localizer = S.of(context);
    return Container(
      height: height,
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          IconButton(
            tooltip: MaterialLocalizations.of(context).previousPageTooltip,
            onPressed: selectedImprovisationIndex > 0 ? () => changePage(selectedImprovisationIndex - 1) : null,
            icon: const Icon(Icons.chevron_left),
          ),
          Expanded(
            child: DropdownButton<int>(
              isExpanded: true,
              value: count == 0 ? null : selectedImprovisationIndex,
              onChanged: (value) {
                if (value != null) changePage(value);
              },
              items: [
                for (var index = 0; index < match.improvisations.length; index++)
                  DropdownMenuItem(
                    value: index,
                    child: Text(localizer.improvisationNumber(order: index + 1), overflow: TextOverflow.ellipsis),
                  ),
                if (match.enableStatistics)
                  DropdownMenuItem(value: match.improvisations.length, child: Text(localizer.matchSummary)),
              ],
            ),
          ),
          IconButton(
            tooltip: MaterialLocalizations.of(context).nextPageTooltip,
            onPressed: selectedImprovisationIndex + 1 < count ? () => changePage(selectedImprovisationIndex + 1) : null,
            icon: const Icon(Icons.chevron_right),
          ),
          IconButton(tooltip: localizer.addImprovisation, onPressed: onAdd, icon: const Icon(Icons.add_circle_outline)),
        ],
      ),
    );
  }
}
