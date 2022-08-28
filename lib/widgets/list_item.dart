import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:monpacing/cubits/pacings_cubit.dart';

import '../models/base_model.dart';
import '../models/pacing_model.dart';
import '../pages/pacing_page.dart';

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
            var copy = PacingModel(
              createdDate: model.createdDate,
              id: model.id,
              improvisations: model.improvisations,
              modifiedDate: model.modifiedDate,
              name: model.name,
            );

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
                if (entity is PacingModel) {
                  var model = entity as PacingModel;
                  context.read<PacingsCubit>().delete(model);
                }
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
