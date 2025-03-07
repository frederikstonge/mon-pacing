import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/bottom_sheet/bottom_sheet_appbar.dart';
import '../../../components/bottom_sheet/bottom_sheet_scaffold.dart';
import '../../../components/display_language/display_language.dart';
import '../../../l10n/generated/app_localizations.dart';

class LanguageView extends StatelessWidget {
  final Locale currentLocale;
  final List<Locale> availableLocales;
  final FutureOr<void> Function(Locale locale) onChanged;

  const LanguageView({super.key, required this.currentLocale, required this.availableLocales, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(title: S.of(context).language),
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: ListTile(title: DisplayLanguage(locale: currentLocale), trailing: const Icon(Icons.check)),
          ),
          ...availableLocales
              .where((element) => element != currentLocale)
              .map(
                (e) => InkWell(
                  onTap: () async {
                    final navigator = Navigator.of(context);
                    await onChanged(e);
                    navigator.pop();
                  },
                  child: ListTile(title: DisplayLanguage(locale: e)),
                ),
              ),
        ],
      ),
    );
  }
}
