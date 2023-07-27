import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../cubits/matches/matches_cubit.dart';
import '../../cubits/pacings/pacings_cubit.dart';
import '../../dialogs/delete_dialog.dart';
import '../../dialogs/text_dialog.dart';
import '../../helpers/path_helper.dart';
import '../../l10n/generated/l10n.dart';
import '../../models/base_model.dart';
import '../../models/match_model.dart';
import '../../models/pacing_model.dart';
import '../../router/routes.dart';

class Item<T extends BaseModel> extends StatelessWidget {
  final T entity;

  const Item({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        title: Text(
          entity.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        subtitle: Text(
          S.of(context).ListItem_Modified(DateFormat.yMd().add_jm().format(entity.modifiedDate!)),
          overflow: TextOverflow.fade,
          maxLines: 2,
        ),
        onTap: () async {
          if (entity is PacingModel) {
            final model = entity as PacingModel;
            context.goNamed(Routes.pacing, pathParameters: {'id': model.id.toString()});
          } else if (entity is MatchModel) {
            final model = entity as MatchModel;
            context.goNamed(Routes.match, pathParameters: {'id': model.id.toString()});
          }
        },
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await DeleteDialog.showDeleteDialog(context, entity.name, () async {
                  if (entity is PacingModel) {
                    final model = entity as PacingModel;
                    await context.read<PacingsCubit>().delete(model);
                  } else if (entity is MatchModel) {
                    final model = entity as MatchModel;
                    await context.read<MatchesCubit>().delete(model);
                  }
                });
              },
            ),
            if (entity is PacingModel)
              IconButton(
                icon: const Icon(Icons.upload),
                onPressed: () async {
                  final localizer = S.of(context);
                  final messenger = ScaffoldMessenger.of(context);
                  final model = entity as PacingModel;
                  final data = Uint8List.fromList(utf8.encode(jsonEncode(model.toJson())));
                  final fileName = PathHelper.removeIllegalCharacters("${model.name}.json");
                  final params = SaveFileDialogParams(data: data, fileName: fileName);
                  final filePath = await FlutterFileDialog.saveFile(params: params);
                  if (filePath != null) {
                    messenger.showSnackBar(SnackBar(content: Text(localizer.ListItem_ExportSuccess(filePath, fileName))));
                  }
                },
              ),
            if (entity is PacingModel && (entity as PacingModel).improvisations.isNotEmpty)
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () async {
                  final model = entity as PacingModel;
                  await TextDialog.showTextDialog(
                    context,
                    S.of(context).MatchOptionsView_Name,
                    model.name,
                    true,
                    (value) async {
                      final router = GoRouter.of(context);
                      final matchCubit = context.read<MatchesCubit>();
                      var matchModel = MatchModel(
                        createdDate: null,
                        modifiedDate: null,
                        id: null,
                        name: value,
                        improvisations: model.copyWith().improvisations,
                        penalties: [],
                        teams: [],
                        points: [],
                      );
                      matchModel = await matchCubit.add(matchModel);
                      router.goNamed(Routes.match, pathParameters: {'id': matchModel.id.toString()});
                    },
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
