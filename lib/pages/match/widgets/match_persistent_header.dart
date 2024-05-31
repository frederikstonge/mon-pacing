import 'package:flutter/material.dart';

import '../../../components/actions/loading_icon_button.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/match_model.dart';

class MatchPersistentHeader extends SliverPersistentHeaderDelegate {
  static const double height = 70;
  final MatchModel match;
  final int selectedImprovisationIndex;
  final void Function(int page) changePage;

  MatchPersistentHeader({
    required this.match,
    required this.selectedImprovisationIndex,
    required this.changePage,
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
      color: Theme.of(context).colorScheme.surface,
      child: NavigationToolbar(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            LoadingIconButton(
              icon: const Icon(Icons.arrow_back),
              tooltip: S.of(context).previousImprovisation,
              onPressed: selectedImprovisationIndex > 0 ? () => changePage(selectedImprovisationIndex - 1) : null,
            ),
          ],
        ),
        middle: DropdownButtonFormField<int>(
          isExpanded: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          icon: const Icon(Icons.arrow_downward),
          value: selectedImprovisationIndex,
          onChanged: (value) {
            if (value != null) {
              changePage(value);
            }
          },
          items: [
            ...match.improvisations.asMap().entries.map(
                  (e) => DropdownMenuItem(
                    value: e.key,
                    child: Row(
                      children: [
                        Expanded(child: Text(S.of(context).improvisationNumber(order: e.key + 1))),
                      ],
                    ),
                  ),
                ),
            if (match.enableStatistics) ...[
              DropdownMenuItem(
                value: match.improvisations.length,
                child: Row(
                  children: [
                    Expanded(child: Text(S.of(context).matchSummary)),
                  ],
                ),
              ),
            ],
          ],
        ),
        trailing: LoadingIconButton(
          icon: const Icon(Icons.arrow_forward),
          tooltip: S.of(context).nextImprovisation,
          onPressed: selectedImprovisationIndex < (match.improvisations.length - (match.enableStatistics ? 0 : 1))
              ? () => changePage(selectedImprovisationIndex + 1)
              : null,
        ),
      ),
    );
  }
}
