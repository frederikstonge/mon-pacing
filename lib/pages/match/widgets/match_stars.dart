import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/actions/loading_icon_button.dart';
import '../../../components/team_color_avatar/team_color_avatar.dart';
import '../../../models/star_model.dart';
import '../../../models/team_model.dart';

class MatchStars extends StatelessWidget {
  final List<StarModel> stars;
  final List<TeamModel> teams;
  final FutureOr<void> Function(StarModel star) onChanged;
  final FutureOr<void> Function(int starId) onRemove;
  final FutureOr<void> Function(int oldIndex, int newIndex) onDrag;
  final FutureOr<void> Function() onDragStart;

  const MatchStars({
    super.key,
    required this.stars,
    required this.teams,
    required this.onChanged,
    required this.onRemove,
    required this.onDrag,
    required this.onDragStart,
  });

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      onReorderStart: (index) => onDragStart(),
      onReorder: onDrag,
      children: stars
          .asMap()
          .entries
          .map(
            (d) => Container(
              key: ValueKey(d.value.id),
              color: Theme.of(context).cardTheme.color,
              child: MatchStarItem(
                index: d.key,
                star: d.value,
                teams: teams,
                valueChanged: (value) async {
                  await onChanged(value);
                },
                onRemove: onRemove,
              ),
            ),
          )
          .toList(),
    );
  }
}

class MatchStarItem extends StatelessWidget {
  final StarModel star;
  final int index;
  final List<TeamModel> teams;
  final ValueChanged<StarModel> valueChanged;
  final FutureOr<void> Function(int starId) onRemove;

  const MatchStarItem({
    super.key,
    required this.star,
    required this.index,
    required this.teams,
    required this.valueChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ReorderableDragStartListener(
              index: index,
              child: const Icon(Icons.drag_handle),
            ),
          ),
          Expanded(
            child: DropdownButtonFormField<int>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              icon: const Icon(Icons.arrow_downward),
              value: star.teamId,
              onChanged: (value) {
                if (value != null) {
                  valueChanged(star.copyWith(teamId: value));
                }
              },
              items: teams
                  .map(
                    (e) => DropdownMenuItem(
                      value: e.id,
                      child: Row(
                        children: [
                          TeamColorAvatar(color: Color(e.color)),
                          const SizedBox(width: 6),
                          Text(
                            e.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: DropdownButtonFormField<int>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              icon: const Icon(Icons.arrow_downward),
              value: teams.firstWhere((t) => t.id == star.teamId).performers.any((p) => p.id == star.performerId)
                  ? star.performerId
                  : teams.firstWhere((t) => t.id == star.teamId).performers.first.id,
              onChanged: (value) {
                if (value != null) {
                  valueChanged(star.copyWith(performerId: value));
                }
              },
              items: teams
                  .firstWhere((t) => t.id == star.teamId)
                  .performers
                  .map(
                    (e) => DropdownMenuItem(
                      value: e.id,
                      child: Text(
                        e.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          LoadingIconButton(
            icon: const Icon(Icons.remove),
            onPressed: () async {
              await onRemove(star.id);
            },
          ),
        ],
      ),
    );
  }
}
