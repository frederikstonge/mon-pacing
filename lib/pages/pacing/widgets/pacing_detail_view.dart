import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/bottom_sheet_dialog/bottom_sheet_appbar.dart';
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
    return Scaffold(
      appBar: BottomSheetAppbar(
        title: Text(editMode ? S.of(context).editPacing : S.of(context).createPacing),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: ListView(
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
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 8, right: 8, bottom: MediaQuery.of(context).viewInsets.bottom),
        child: FilledButton(
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              widget.onConfirm(pacing);
              Navigator.of(context).pop();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Errors in form')));
            }
          },
          child: Text(editMode ? S.of(context).save : S.of(context).create),
        ),
      ),
    );
  }
}
