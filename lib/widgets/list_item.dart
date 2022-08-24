import 'package:flutter/material.dart';

import '../models/base_model.dart';

class ListItem extends StatelessWidget {
  final BaseModel entity;
  const ListItem({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(entity.name!),
        subtitle: entity.modifiedDate != null ? Text("Modified on ${entity.modifiedDate}") : Text("Created on ${entity.createdDate}"),
      ),
    );
  }
}
