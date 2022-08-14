import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ipage.dart';
import '../cubits/settings_cubit.dart';
import '../views/settings_view.dart';

class SettingsPage extends StatelessWidget implements IPage {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Icon get icon => const Icon(Icons.settings);

  @override
  String get title => "Settings";

  @override
  FloatingActionButton? get floatingActionButton => null;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit(),
      child: const SettingsView(),
    );
  }
}
