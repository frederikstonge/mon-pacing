import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../components/search/search_dialog.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../extensions/improvisation_extensions.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/improvisation_model.dart';
import '../../repositories/improvisations_repository.dart';
import '../../router/routes.dart';

class ImprovisationsSearchPageView extends StatelessWidget {
  const ImprovisationsSearchPageView({super.key});

  static Future<String?> showDialog(BuildContext context) async {
    return await GoRouter.of(context).pushNamed<String>(Routes.improvisationsSearch);
  }

  @override
  Widget build(BuildContext context) {
    return SearchDialog(
      onChanged: (query, _) => context.read<ImprovisationsRepository>().search(query),
      hintText: S.of(context).search(category: S.of(context).improvisations),
      itemBuilder: (context, item) {
        final improvisation = ImprovisationModel.fromEntity(entity: item);
        return InkWell(
          onTap: () {
            Navigator.of(context).maybePop(item);
          },
          child: ListTile(
            leading: const SizedBox(height: double.infinity, child: Icon(Icons.search)),
            isThreeLine: true,
            title: Text(
              improvisation.toHumanReadableString(context.read<SettingsCubit>().state.improvisationFieldsOrder),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              S.of(context).modifiedDate(date: item.modifiedDate!),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
