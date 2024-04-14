import 'dart:async';

import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../models/penalties_behavior.dart';
import '../bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../bottom_sheet_dialog/bottom_sheet_scaffold.dart';

class PenaltiesBehaviorView extends StatelessWidget {
  final PenaltiesBehavior currentPenaltiesBehavior;
  final FutureOr<void> Function(PenaltiesBehavior penaltiesBehavior) onChanged;

  const PenaltiesBehaviorView({
    super.key,
    required this.currentPenaltiesBehavior,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(title: S.of(context).penaltiesBehavior),
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
                _getPenaltiesBehaviorString(context, currentPenaltiesBehavior),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Icon(Icons.check),
            ),
          ),
          ...PenaltiesBehavior.values.where((element) => element != currentPenaltiesBehavior).map(
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

  String _getPenaltiesBehaviorString(BuildContext context, PenaltiesBehavior penaltiesBehavior) {
    return switch (penaltiesBehavior) {
      PenaltiesBehavior.addPoints => S.of(context).penaltiesBehaviorAdd,
      PenaltiesBehavior.substractPoints => S.of(context).penaltiesBehaviorSubstract,
    };
  }
}
