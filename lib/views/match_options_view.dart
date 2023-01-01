import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:settings_ui/settings_ui.dart';

import '../generated/l10n.dart';
import '../cubits/match_cubit.dart';
import '../helpers/validator_helper.dart';
import '../models/match_model.dart';

class MatchOptionsView extends StatelessWidget {
  static const int teamNameMaxLength = 20;

  final GlobalKey<FormState> formKey;
  final bool isNew;

  const MatchOptionsView({super.key, required this.formKey, required this.isNew});

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
      child: BlocBuilder<MatchCubit, MatchModel>(
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
            title: Text(S.of(context).MatchOptionsView_Title(state.name), overflow: TextOverflow.ellipsis),
          ),
          body: Builder(
            builder: (context) {
              var controller = context.read<MatchCubit>().nameController;
              return Form(
                autovalidateMode: AutovalidateMode.always,
                key: formKey,
                child: SettingsList(
                  sections: [
                    SettingsSection(
                      tiles: [
                        SettingsTile(
                          title: Text(S.of(context).MatchOptionsView_Name, overflow: TextOverflow.ellipsis),
                          value: TextFormField(
                            autofocus: isNew,
                            onChanged: (value) {
                              context.read<MatchCubit>().editName(controller.text);
                            },
                            validator: (value) {
                              return ValidationHelper.fieldIsRequired(value);
                            },
                            controller: controller,
                          ),
                        )
                      ],
                    ),
                    SettingsSection(
                      title: ListTile(
                        title: Text(S.of(context).MatchOptionsView_Teams, overflow: TextOverflow.ellipsis),
                        trailing: state.teams.length < 3
                            ? IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  context.read<MatchCubit>().addTeam();
                                },
                              )
                            : null,
                      ),
                      tiles: state.teams.map(
                        (e) {
                          var teamController = context.read<MatchCubit>().controllers[e.order];
                          return SettingsTile(
                            leading: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return AlertDialog(
                                      title: Text(S.of(context).MatchOptionsView_TeamColor, overflow: TextOverflow.ellipsis),
                                      content: SingleChildScrollView(
                                        child: BlockPicker(
                                          pickerColor: Color(e.color),
                                          onColorChanged: (value) async {
                                            context.read<MatchCubit>().editTeam(e.copyWith(color: value.value));
                                            Navigator.pop(dialogContext);
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor: Color(e.color),
                              ),
                            ),
                            title: TextFormField(
                              controller: teamController,
                              onChanged: (value) {
                                context.read<MatchCubit>().editTeam(e.copyWith(name: teamController.text));
                              },
                              decoration: const InputDecoration(
                                hintText: "Team name",
                              ),
                              validator: (value) {
                                return ValidationHelper.fieldIsRequired(value);
                              },
                              maxLength: teamNameMaxLength,
                              maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            ),
                            trailing: state.teams.length > 1
                                ? IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      context.read<MatchCubit>().removeTeam(e);
                                    },
                                  )
                                : null,
                          );
                        },
                      ).toList(),
                    )
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
