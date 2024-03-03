import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../../components/actions/loading_button.dart';
import '../../../components/actions/loading_icon_button.dart';
import '../../../components/bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../../../components/bottom_sheet_dialog/bottom_sheet_scaffold.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../components/form/text_field_element.dart';
import '../../../components/text_header/text_header.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/constants.dart';
import '../../../models/match_model.dart';
import '../../../models/pacing_model.dart';
import '../../../models/team_model.dart';
import '../../../validators/validator.dart';
import 'team_tile.dart';

class MatchDetailView extends StatefulWidget {
  final PacingModel? pacing;
  final MatchModel? match;
  final FutureOr<void> Function(MatchModel value) onConfirm;

  const MatchDetailView({
    super.key,
    required this.onConfirm,
    this.pacing,
    this.match,
  });

  @override
  State<MatchDetailView> createState() => _MatchDetailViewState();
}

class _MatchDetailViewState extends State<MatchDetailView> {
  late final bool editMode;
  late final TextEditingController _nameController;
  late MatchModel match;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    editMode = widget.match != null;
    match = editMode
        ? widget.match!.copyWith()
        : const MatchModel(
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
  void didChangeDependencies() {
    if (!editMode) {
      final teams = List<TeamModel>.from(match.teams);
      for (int i = 0; i < widget.pacing!.defaultNumberOfTeams; i++) {
        teams.add(_createTeam(teams));
      }

      setState(() => match = match.copyWith(teams: teams));
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(
        title: editMode ? S.of(context).editMatch : S.of(context).startMatch,
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
                trailing: LoadingIconButton(
                  icon: const Icon(Icons.add),
                  onPressed: !editMode && match.teams.length < Constants.maximumTeams
                      ? () {
                          final teams = List<TeamModel>.from(match.teams);
                          teams.add(_createTeam(teams));
                          setState(() => match = match.copyWith(teams: teams));
                        }
                      : null,
                ),
              ),
            ),
            CustomCard(
              child: Column(
                children: match.teams
                    .asMap()
                    .entries
                    .map(
                      (e) => TeamTile(
                        team: e.value,
                        onChanged: (value) {
                          final teams = List<TeamModel>.from(match.teams);
                          teams[e.key] = value;
                          setState(() => match = match.copyWith(teams: teams));
                        },
                        onDelete: !editMode && match.teams.length > Constants.minumumTeams
                            ? () {
                                final teams = List<TeamModel>.from(match.teams);
                                teams.removeAt(e.key);
                                setState(() => match = match.copyWith(teams: teams));
                              }
                            : null,
                      ),
                    )
                    .toList(),
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
              child: LoadingButton.filled(
                onPressed: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    final navigator = Navigator.of(context);
                    await widget.onConfirm(match);
                    navigator.pop();
                  }
                },
                child: Text(
                  editMode ? S.of(context).edit : S.of(context).create,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TeamModel _createTeam(List<TeamModel> teams) {
    final nextId = teams.isNotEmpty ? teams.map((e) => e.id).toList().reduce(max) + 1 : 0;
    final random = Random();
    return TeamModel(
      id: nextId,
      name: '${S.of(context).team} ${teams.length + 1}',
      color: Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1).value,
    );
  }
}
