import 'package:flutter/material.dart';

import '../../extensions/duration_extensions.dart';
import '../../extensions/improvisation_extensions.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/improvisation_fields.dart';
import '../../models/improvisation_model.dart';
import '../../models/improvisation_type.dart';

class ImprovisationShortDetail extends StatelessWidget {
  final ImprovisationModel improvisation;
  final List<ImprovisationFields> improvisationFieldsOrder;

  const ImprovisationShortDetail({super.key, required this.improvisation, required this.improvisationFieldsOrder});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: improvisationFieldsOrder
          .map(
            (field) => switch (field) {
              ImprovisationFields.type => Text(
                '${S.of(context).type}: ${improvisation.type == ImprovisationType.mixed ? S.of(context).mixed : S.of(context).compared}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              ImprovisationFields.category => Text(
                '${S.of(context).category}: ${improvisation.getCategoryString(S.of(context))}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              ImprovisationFields.performers => Text(
                '${S.of(context).performers}: ${improvisation.getPerformersString(S.of(context))}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              ImprovisationFields.durations => Text(
                '${S.of(context).duration}: ${improvisation.durationsInSeconds.map((e) => Duration(seconds: e).toImprovDuration()).join(', ')}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              ImprovisationFields.theme => Text(
                '${S.of(context).theme}: ${improvisation.theme}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              _ => const SizedBox.shrink(),
            },
          )
          .toList(),
    );
  }
}
