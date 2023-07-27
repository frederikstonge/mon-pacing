import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'cubits/settings/settings_cubit.dart';
import 'helpers/material_color_helper.dart';
import 'l10n/generated/l10n.dart';
import 'models/settings_model.dart';
import 'router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsModel>(
      builder: (context, state) => MaterialApp.router(
        key: ValueKey(state.language),
        title: 'MonPacing',
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch: MaterialColorHelper.generateMaterialColor(color: Color(state.color)),
          brightness: Brightness.light,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Locale(state.language),
      ),
    );
  }
}
