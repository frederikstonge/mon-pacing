import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubits/pacings_cubit.dart';
import '../models/base_model.dart';
import '../models/pacing_model.dart';
import '../pages/pacing_page.dart';
import 'delete_dialog.dart';

class ListItem extends StatelessWidget {
  final BaseModel entity;
  const ListItem({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(entity.name!),
        subtitle: Text("Modified on ${DateFormat.yMd().add_jm().format(entity.modifiedDate!)}"),
        onTap: () {
          if (entity is PacingModel) {
            var model = entity as PacingModel;
            var copy = PacingModel.fromCopy(model);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => PacingPage(model: copy)),
                ));
          }
        },
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                DeleteDialog.showDeleteDialog(context, entity.name ?? "", () {
                  if (entity is PacingModel) {
                    var model = entity as PacingModel;
                    context.read<PacingsCubit>().delete(model);
                  }
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
