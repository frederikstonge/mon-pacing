import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../../../components/display_language/display_language.dart';
import '../../../cubits/settings/settings_cubit.dart';
import '../../../cubits/settings/settings_state.dart';
import '../../../l10n/app_localizations.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomSheetAppbar(title: Text(S.of(context).language)),
            Flexible(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: ListTile(
                      title: DisplayLanguage(
                        locale: Locale(state.language),
                      ),
                      trailing: const Icon(Icons.check),
                    ),
                  ),
                  ...S.supportedLocales.where((element) => element.toLanguageTag() != state.language).map(
                        (e) => InkWell(
                          onTap: () {
                            context.read<SettingsCubit>().edit(state.copyWith(language: e.toLanguageTag()));
                            Navigator.of(context).pop();
                          },
                          child: ListTile(
                            title: DisplayLanguage(
                              locale: e,
                            ),
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
