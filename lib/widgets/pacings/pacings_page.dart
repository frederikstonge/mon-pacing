import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:intl/intl.dart';

import '../../cubits/pacings/pacings_cubit.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../dialogs/text_dialog.dart';
import '../../l10n/generated/l10n.dart';
import '../../models/pacing_model.dart';
import '../home/ibottom_nav_page.dart';
import '../pacing/pacing_page.dart';
import 'pacings_view.dart';

class PacingsPage extends StatelessWidget implements IBottomNavPage {
  const PacingsPage({super.key});

  @override
  Icon get icon => const Icon(Icons.list);

  @override
  String get title => S.current.PacingsPage_Title;

  @override
  FloatingActionButton? getFloatingActionButton(BuildContext context) => FloatingActionButton(
        onPressed: () async {
          await TextDialog.showTextDialog(
            context,
            title,
            S.of(context).PacingPage_NewPacingName(DateFormat.yMd().add_jm().format(DateTime.now())),
            true,
            (value) async {
              final navigator = Navigator.of(context);
              final pacingsCubit = context.read<PacingsCubit>();
              final settingsCubit = context.read<SettingsCubit>();

              final model = PacingModel(
                createdDate: null,
                id: null,
                modifiedDate: null,
                name: value,
                enablePaddingDuration: settingsCubit.state.enableDefaultPaddingDuration,
                paddingDuration: settingsCubit.state.defaultPaddingDuration,
                improvisations: [],
                defaultNumberOfTeams: 2,
              );

              final pacingModel = await pacingsCubit.add(model);
              await navigator.push(MaterialPageRoute(builder: ((context) => PacingPage(model: pacingModel))));
            },
          );
        },
        tooltip: S.of(context).PacingsPage_AddPacingTooltip,
        child: const Icon(Icons.add),
      );

  @override
  List<Widget>? getActions(BuildContext context) {
    return [
      IconButton(
        onPressed: (() async {
          final cubit = context.read<PacingsCubit>();
          const params = OpenFileDialogParams(
            dialogType: OpenFileDialogType.document,
            sourceType: SourceType.photoLibrary,
            fileExtensionsFilter: ["json"],
          );
          try {
            final filePath = await FlutterFileDialog.pickFile(params: params);
            if (filePath != null) {
              final pacingValue = await File(filePath).readAsString();
              final pacing = PacingModel.fromJson(jsonDecode(pacingValue));
              await cubit.add(pacing.copyWith(id: null));
            }
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(S.of(context).PacingsPage_ImportError)));
          }
        }),
        icon: const Icon(Icons.download),
        tooltip: S.of(context).PacingsPage_ImportTooltip,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return const PacingsView();
  }
}
