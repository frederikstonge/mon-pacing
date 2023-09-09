import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../cubits/pacings/pacings_cubit.dart';
import '../../cubits/pacings/pacings_state.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../dialogs/text_dialog.dart';
import '../../l10n/generated/l10n.dart';
import '../../models/pacing_model.dart';
import '../../router/routes.dart';
import '../common/items_list.dart';

class PacingsView extends StatelessWidget {
  const PacingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await TextDialog.showTextDialog(
            context,
            S.of(context).PacingOptionsView_Name,
            S.of(context).PacingPage_NewPacingName(DateFormat.yMd().add_jm().format(DateTime.now())),
            true,
            (value) async {
              final router = GoRouter.of(context);
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
              router.goNamed(Routes.pacing, pathParameters: {'id': pacingModel.id.toString()});
            },
          );
        },
        tooltip: S.of(context).PacingsPage_AddPacingTooltip,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(S.of(context).PacingsPage_Title),
        actions: [
          IconButton(
            onPressed: (() async {
              final cubit = context.read<PacingsCubit>();
              final scaffoldMessenger = ScaffoldMessenger.of(context);
              final localizer = S.of(context);
              const params = OpenFileDialogParams(
                dialogType: OpenFileDialogType.document,
                sourceType: SourceType.photoLibrary,
                fileExtensionsFilter: ['json'],
              );
              try {
                final filePath = await FlutterFileDialog.pickFile(params: params);
                if (filePath != null) {
                  final pacingValue = await File(filePath).readAsString();
                  final pacing = PacingModel.fromJson(jsonDecode(pacingValue));
                  await cubit.add(pacing.copyWith(id: null));
                }
              } catch (e) {
                scaffoldMessenger.showSnackBar(SnackBar(content: Text(localizer.PacingsPage_ImportError)));
              }
            }),
            icon: const Icon(Icons.download),
            tooltip: S.of(context).PacingsPage_ImportTooltip,
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<PacingsCubit, PacingsState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (error) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
              },
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              error: (error) => Center(child: Text(error)),
              success: (pacings, hasReachedMax) => ItemsList(items: pacings, hasReachedMax: hasReachedMax),
            );
          },
        ),
      ),
    );
  }
}
