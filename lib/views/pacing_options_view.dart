import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

import '../cubits/pacing_cubit.dart';
import '../generated/l10n.dart';
import '../helpers/validator_helper.dart';
import '../models/pacing_model.dart';

class PacingOptionsView extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final bool isNew;

  const PacingOptionsView({super.key, required this.formKey, required this.isNew});

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
            automaticallyImplyLeading: !isNew,
            actions: isNew
                ? [
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        Navigator.maybePop(context);
                      },
                    )
                  ]
                : null,
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
                            autofocus: isNew,
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
