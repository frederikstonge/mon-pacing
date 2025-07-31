import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../components/search/search_dialog.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/pacing_model.dart';
import '../../repositories/pacings_repository.dart';
import '../../router/routes.dart';

class PacingsSearchPageView extends StatelessWidget {
  const PacingsSearchPageView({super.key});

  static Future<PacingModel?> showDialog(BuildContext context) async {
    return await GoRouter.of(context).pushNamed<PacingModel>(Routes.pacingsSearch);
  }

  @override
  Widget build(BuildContext context) {
    return SearchDialog(
      onChanged: (query, selectedTags) async {
        final pacings = await context.read<PacingsRepository>().search(query, selectedTags);
        return pacings.map((e) => PacingModel.fromEntity(entity: e)).toList();
      },
      hintText: S.of(context).search(category: S.of(context).pacings),
      itemBuilder: (context, item) => InkWell(
        onTap: () {
          Navigator.of(context).maybePop(item);
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
              Text(S.of(context).modifiedDate(date: item.modifiedDate!), maxLines: 1, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}
