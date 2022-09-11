import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubits/matches_cubit.dart';
import '../cubits/pacings_cubit.dart';
import '../dialogs/message_dialog.dart';
import '../generated/l10n.dart';
import '../models/match_model.dart';
import '../models/base_model.dart';
import '../models/pacing_model.dart';
import '../pages/match_page.dart';
import '../pages/pacing_page.dart';
import '../dialogs/delete_dialog.dart';

class ListItem extends StatelessWidget {
  final BaseModel entity;
  const ListItem({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(entity.name),
        subtitle: Text(S.of(context).ListTile_Modified(DateFormat.yMd().add_jm().format(entity.modifiedDate!))),
        onTap: () {
          if (entity is PacingModel) {
            var model = entity as PacingModel;
            var copy = model.copyWith();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => PacingPage(model: copy)),
                ));
          } else if (entity is MatchModel) {
            var model = entity as MatchModel;
            var copy = model.copyWith();
            Navigator.push(
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
                DeleteDialog.showDeleteDialog(context, entity.name, () {
                  if (entity is PacingModel) {
                    var model = entity as PacingModel;
                    context.read<PacingsCubit>().delete(model);
                  } else if (entity is MatchModel) {
                    var model = entity as MatchModel;
                    context.read<MatchesCubit>().delete(model);
                  }
                });
              },
            ),
            if (entity is PacingModel)
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () {
                  MessageDialog.showMessageDialog(context, "Not implemented", "Matches are not yet implemented.");
                },
              ),
          ],
        ),
      ),
    );
  }
}
