import 'dart:async';

import 'package:flutter/material.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../models/penalties_impact_type.dart';
import '../bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../bottom_sheet_dialog/bottom_sheet_scaffold.dart';

class PenaltiesImpactTypeView extends StatelessWidget {
  final PenaltiesImpactType currentPenaltiesImpactType;
  final FutureOr<void> Function(PenaltiesImpactType penaltiesBehavior) onChanged;

  const PenaltiesImpactTypeView({
    super.key,
    required this.currentPenaltiesImpactType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(title: S.of(context).penaltiesImpactType),
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: ListTile(
              title: Text(
                _getPenaltiesBehaviorString(context, currentPenaltiesImpactType),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Icon(Icons.check),
            ),
          ),
          ...PenaltiesImpactType.values.where((element) => element != currentPenaltiesImpactType).map(
                (e) => InkWell(
                  onTap: () async {
                    final navigator = Navigator.of(context);
                    await onChanged.call(e);

                    navigator.pop();
                  },
                  child: ListTile(
                    title: Text(
                      _getPenaltiesBehaviorString(context, e),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }

  String _getPenaltiesBehaviorString(BuildContext context, PenaltiesImpactType penaltiesBehavior) {
    return switch (penaltiesBehavior) {
      PenaltiesImpactType.addPoints => S.of(context).penaltiesImpactTypeAdd,
      PenaltiesImpactType.substractPoints => S.of(context).penaltiesImpactTypeSubstract,
    };
  }
}
