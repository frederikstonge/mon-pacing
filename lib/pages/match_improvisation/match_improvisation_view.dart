import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/actions/loading_button.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_scaffold.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/improvisation_detail/improvisation_detail.dart';
import '../../components/quantity_stepper/quantity_stepper_form_field.dart';
import '../../l10n/app_localizations.dart';
import 'cubits/match_improvisation_cubit.dart';
import 'cubits/match_improvisation_state.dart';

class MatchImprovisationView extends StatefulWidget {
  const MatchImprovisationView({
    super.key,
  });

  @override
  State<MatchImprovisationView> createState() => _MatchImprovisationViewState();
}

class _MatchImprovisationViewState extends State<MatchImprovisationView> {
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchImprovisationCubit, MatchImprovisationState>(
      builder: (context, state) {
        return BottomSheetScaffold(
          appBar: BottomSheetAppbar(
            title: state.editMode ? S.of(context).addImprovisation : S.of(context).editImprovisation,
          ),
          body: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.always,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                CustomCard(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              S.of(context).improvisationIndex,
                              style: Theme.of(context).textTheme.titleMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          QuantityStepperFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            initialValue: state.index + 1,
                            onChanged: (value) {
                              if (value != null) {
                                context.read<MatchImprovisationCubit>().changeIndex(value - 1);
                              }
                            },
                            minValue: 1,
                            maxValue: context.read<MatchImprovisationCubit>().match.improvisations.length + (state.editMode ? 0 : 1),
                          ),
                        ],
                      ),
                    ),
                    ImprovisationDetail(
                      improvisation: state.improvisation,
                      onChanged: (value) {
                        context.read<MatchImprovisationCubit>().edit(value);
                      },
                    ),
                  ],
                )),
              ],
            ),
          ),
          bottom: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: LoadingButton.filled(
                    onPressed: () async {
                      if (formKey.currentState?.validate() ?? false) {
                        final navigator = Navigator.of(context);
                        await context.read<MatchImprovisationCubit>().onConfirm(state.improvisation, state.index);
                        navigator.pop();
                      }
                    },
                    child: Text(
                      state.editMode ? S.of(context).save : S.of(context).create,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
