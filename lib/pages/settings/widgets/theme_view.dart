import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../../../components/bottom_sheet_dialog/bottom_sheet_scaffold.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../models/theme_type.dart';

class ThemeView extends StatelessWidget {
  final ThemeType currentTheme;
  final FutureOr<void> Function(ThemeType theme) onChanged;

  const ThemeView({
    super.key,
    required this.currentTheme,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(title: S.of(context).theme),
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
                _getThemeString(context, currentTheme),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Icon(Icons.check),
            ),
          ),
          ...ThemeType.values.where((element) => element != currentTheme).map(
                (e) => InkWell(
                  onTap: () async {
                    final navigator = Navigator.of(context);
                    await onChanged.call(e);

                    navigator.pop();
                  },
                  child: ListTile(
                    title: Text(
                      _getThemeString(context, e),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }

  String _getThemeString(BuildContext context, ThemeType theme) {
    return switch (theme) {
      ThemeType.light => S.of(context).light,
      ThemeType.dark => S.of(context).dark,
      ThemeType.lni => S.of(context).lni,
    };
  }
}
