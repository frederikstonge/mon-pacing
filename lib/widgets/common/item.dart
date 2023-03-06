import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:intl/intl.dart';

import '../home/home_cubit.dart';
import '../matches/matches_cubit.dart';
import '../pacings/pacings_cubit.dart';
import '../../dialogs/delete_dialog.dart';
import '../../dialogs/text_dialog.dart';
import '../../generated/l10n.dart';
import '../../helpers/path_helper.dart';
import '../../models/base_model.dart';
import '../../models/match_model.dart';
import '../../models/pacing_model.dart';
import '../match/match_page.dart';
import '../pacing/pacing_page.dart';

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
            var model = entity as PacingModel;
            var copy = model.copyWith();
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => PacingPage(model: copy)),
                ));
          } else if (entity is MatchModel) {
            var model = entity as MatchModel;
            var copy = model.copyWith();
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => MatchPage(model: copy)),
                ));
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
                    var model = entity as PacingModel;
                    await context.read<PacingsCubit>().delete(model);
                  } else if (entity is MatchModel) {
                    var model = entity as MatchModel;
                    await context.read<MatchesCubit>().delete(model);
                  }
                });
              },
            ),
            if (entity is PacingModel)
              IconButton(
                icon: const Icon(Icons.upload),
                onPressed: () async {
                  var localizer = S.of(context);
                  var messenger = ScaffoldMessenger.of(context);
                  var model = entity as PacingModel;
                  var data = Uint8List.fromList(utf8.encode(jsonEncode(model.toJson())));
                  var fileName = PathHelper.removeIllegalCharacters("${model.name}.json");
                  var params = SaveFileDialogParams(data: data, fileName: fileName);
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
                  var model = entity as PacingModel;
                  await TextDialog.showTextDialog(
                    context,
                    S.of(context).MatchOptionsView_Name,
                    model.name,
                    true,
                    (value) async {
                      var navigator = Navigator.of(context);
                      var matchCubit = context.read<MatchesCubit>();
                      var homeCubit = context.read<HomeCubit>();
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
                      await navigator.push(MaterialPageRoute(builder: ((context) => MatchPage(model: matchModel))));
                      homeCubit.setPage(1);
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
