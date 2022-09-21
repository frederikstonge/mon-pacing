import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';

import '../cubits/pacings_cubit.dart';
import '../generated/l10n.dart';
import '../models/pacing_model.dart';
import '../views/pacings_view.dart';
import 'ibottom_nav_page.dart';
import 'pacing_page.dart';

class PacingsPage extends StatelessWidget implements IBottomNavPage {
  const PacingsPage({Key? key}) : super(key: key);

  @override
  Icon get icon => const Icon(Icons.list);

  @override
  String get title => S.current.PacingsPage_Title;

  @override
  FloatingActionButton? getFloatingActionButton(BuildContext context) => FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) => const PacingPage())));
        },
        tooltip: S.of(context).PacingsPage_AddPacingTooltip,
        child: const Icon(Icons.add),
      );

  @override
  List<Widget>? getActions(BuildContext context) {
    return [
      IconButton(
        onPressed: (() async {
          var cubit = context.read<PacingsCubit>();
          const params = OpenFileDialogParams(
            dialogType: OpenFileDialogType.document,
            sourceType: SourceType.photoLibrary,
            fileExtensionsFilter: ["json"],
          );
          try {
            final filePath = await FlutterFileDialog.pickFile(params: params);
            if (filePath != null) {
              var pacingValue = await File(filePath).readAsString();
              var pacing = PacingModel.fromJson(jsonDecode(pacingValue));
              cubit.add(pacing.copyWith(id: null));
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
    return PacingsView();
  }
}
