import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../components/bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../../../components/bottom_sheet_dialog/bottom_sheet_scaffold.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../components/form/text_field_element.dart';
import '../../../components/settings_tile/settings_tile.dart';
import '../../../components/text_header/text_header.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/match_model.dart';
import '../../../models/pacing_model.dart';
import '../../../validators/validator.dart';

class CreateMatchView extends StatefulWidget {
  final PacingModel? pacing;
  final AsyncValueSetter<MatchModel> onConfirm;

  const CreateMatchView({
    super.key,
    required this.onConfirm,
    this.pacing,
  });

  @override
  State<CreateMatchView> createState() => _CreateMatchViewState();
}

class _CreateMatchViewState extends State<CreateMatchView> {
  late final TextEditingController _nameController;
  late MatchModel match;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    match = const MatchModel(
      id: 0,
      name: '',
      createdDate: null,
      modifiedDate: null,
      improvisations: [],
      teams: [],
      penalties: [],
      points: [],
    );

    _nameController = TextEditingController(text: match.name);
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(
        title: Text(S.of(context).startMatch),
      ),
      isBodyExpanded: true,
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: TextHeader(title: S.of(context).general),
            ),
            CustomCard(
              child: Column(
                children: [
                  TextFieldElement(
                    autoFocus: true,
                    label: '${S.of(context).name}*',
                    controller: _nameController,
                    validator: (value) {
                      return Validators.stringRequired(value);
                    },
                    onChanged: (value) {
                      setState(() {
                        match = match.copyWith(name: value);
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: TextHeader(
                title: S.of(context).teams,
                trailing: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
              ),
            ),
            CustomCard(
              child: Column(
                children: [
                  SettingsTile(
                    leading: const Icon(Icons.color_lens),
                    title: Text(S.of(context).enableTimeBuffer),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottom: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: FilledButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    widget.onConfirm(match);
                    Navigator.of(context).pop();
                  }
                },
                child: Text(S.of(context).create),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
