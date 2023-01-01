import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

import '../cubits/pacing_cubit.dart';
import '../generated/l10n.dart';
import '../helpers/validator_helper.dart';
import '../models/pacing_model.dart';

class PacingOptionsView extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const PacingOptionsView({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        var result = formKey.currentState!.validate();
        if (!result) {
          ValidationHelper.showValidationMessageDialog(context);
        }
        return Future.value(result);
      },
      child: BlocBuilder<PacingCubit, PacingModel>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).PacingOptionsView_Title(state.name), overflow: TextOverflow.ellipsis),
          ),
          body: Builder(
            builder: (context) {
              var controller = context.read<PacingCubit>().nameController;
              return Form(
                autovalidateMode: AutovalidateMode.always,
                key: formKey,
                child: SettingsList(
                  sections: [
                    SettingsSection(
                      tiles: [
                        SettingsTile(
                          title: Text(S.of(context).PacingOptionsView_Name, overflow: TextOverflow.ellipsis),
                          value: TextFormField(
                            onChanged: (value) {
                              context.read<PacingCubit>().editName(controller.text);
                            },
                            validator: (value) {
                              return ValidationHelper.fieldIsRequired(value);
                            },
                            controller: controller,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
