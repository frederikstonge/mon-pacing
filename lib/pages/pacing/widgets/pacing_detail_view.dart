import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../../../components/bottom_sheet_dialog/bottom_sheet_scaffold.dart';
import '../../../cubits/settings/settings_cubit.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/pacing_model.dart';
import '../../../validators/validator.dart';

class PacingDetailView extends StatefulWidget {
  final PacingModel? pacing;
  final AsyncValueSetter<PacingModel> onConfirm;

  const PacingDetailView({
    super.key,
    required this.onConfirm,
    this.pacing,
  });

  @override
  State<PacingDetailView> createState() => _PacingDetailViewState();
}

class _PacingDetailViewState extends State<PacingDetailView> {
  late final TextEditingController _nameController;
  late final bool editMode;
  late PacingModel pacing;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    editMode = widget.pacing != null;
    pacing = editMode
        ? widget.pacing!
        : PacingModel(
            id: 0,
            name: '',
            enableTimeBuffer: context.read<SettingsCubit>().state.enableDefaultTimeBuffer,
            timeBufferInSeconds: context.read<SettingsCubit>().state.defaultTimeBufferInSeconds,
            createdDate: null,
            modifiedDate: null,
            defaultNumberOfTeams: 2,
            improvisations: [],
          );

    _nameController = TextEditingController(text: pacing.name);
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(
        title: Text(editMode ? S.of(context).editPacing : S.of(context).createPacing),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            TextFormField(
              controller: _nameController,
              validator: (value) {
                return Validators.stringRequired(context, 'Name', value);
              },
            ),
          ],
        ),
      ),
      bottom: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: FilledButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    widget.onConfirm(pacing);
                    Navigator.of(context).pop();
                  }
                },
                child: Text(editMode ? S.of(context).save : S.of(context).create),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
