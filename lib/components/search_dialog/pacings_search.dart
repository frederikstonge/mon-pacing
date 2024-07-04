import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';
import '../../repositories/pacings_repository.dart';
import '../../router/routes.dart';
import 'search_dialog.dart';

class PacingsSearch extends StatelessWidget {
  const PacingsSearch({super.key});

  static void showDialog(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PacingsSearch()));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<PacingsRepository>().getAllTags(),
      builder: (context, snapshot) => SearchDialog(
        onChanged: (query, selectedTags) => context.read<PacingsRepository>().search(query, selectedTags),
        tags: snapshot.data,
        itemBuilder: (context, item) => InkWell(
          onTap: () {
            Navigator.of(context).pop();
            GoRouter.of(context).goNamed(Routes.pacing, pathParameters: {'id': '${item.id}'});
          },
          child: ListTile(
            leading: const SizedBox(height: double.infinity, child: Icon(Icons.search)),
            isThreeLine: true,
            title: Text(
              item.name,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).improvisationCount(count: item.improvisations.length),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  S.of(context).modifiedDate(date: item.modifiedDate!),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
