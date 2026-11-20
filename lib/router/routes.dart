import 'package:kaisel/kaisel.dart';
import 'package:material_ui/material_ui.dart';

import '../models/improvisation_model.dart';
import '../models/match_model.dart';
import '../models/pacing_model.dart';
import '../models/penalties_impact_type.dart';
import '../models/penalty_model.dart';
import '../models/team_model.dart';
import '../models/theme_type.dart';

sealed class AppRoute extends KaiselRoute {
  const AppRoute();
}

final class OnboardingRoute extends AppRoute {
  const OnboardingRoute();
}

final class TabsRoute extends AppRoute {
  const TabsRoute();
}

final class ScannerRoute extends AppRoute {
  const ScannerRoute();
}

final class CategoriesSearchRoute extends AppRoute {
  const CategoriesSearchRoute();
}

final class PenaltiesSearchRoute extends AppRoute {
  const PenaltiesSearchRoute();
}

final class TagsSearchRoute extends AppRoute {
  const TagsSearchRoute();
}

final class PacingDetailModalRoute extends AppRoute implements KaiselModalRoute<PacingModel> {
  const PacingDetailModalRoute({this.pacing, required this.editMode});

  final PacingModel? pacing;
  final bool editMode;

  @override
  List<Object?> get props => [pacing, editMode];
}

final class MatchDetailModalRoute extends AppRoute implements KaiselModalRoute<MatchModel> {
  const MatchDetailModalRoute({this.match, this.pacing});

  final MatchModel? match;
  final PacingModel? pacing;

  @override
  List<Object?> get props => [match, pacing];
}

final class TeamDetailModalRoute extends AppRoute implements KaiselModalRoute<TeamModel> {
  const TeamDetailModalRoute({this.team, required this.editMode});

  final TeamModel? team;
  final bool editMode;

  @override
  List<Object?> get props => [team, editMode];
}

final class DurationPickerModalRoute extends AppRoute implements KaiselModalRoute<Duration> {
  const DurationPickerModalRoute({required this.title, required this.initialDuration});

  final String title;
  final Duration initialDuration;

  @override
  List<Object?> get props => [title, initialDuration];
}

final class ColorPickerModalRoute extends AppRoute implements KaiselModalRoute<Color> {
  const ColorPickerModalRoute({required this.title, required this.initialColor});

  final String title;
  final Color initialColor;

  @override
  List<Object?> get props => [title, initialColor];
}

final class LanguageModalRoute extends AppRoute implements KaiselModalRoute<Locale> {
  const LanguageModalRoute({required this.currentLocale, required this.availableLocales});

  final Locale currentLocale;
  final List<Locale> availableLocales;

  @override
  List<Object?> get props => [currentLocale, availableLocales];
}

final class ThemeModalRoute extends AppRoute implements KaiselModalRoute<ThemeType> {
  const ThemeModalRoute(this.currentTheme);

  final ThemeType currentTheme;

  @override
  List<Object?> get props => [currentTheme];
}

final class PenaltiesImpactTypeModalRoute extends AppRoute implements KaiselModalRoute<PenaltiesImpactType> {
  const PenaltiesImpactTypeModalRoute(this.currentType);

  final PenaltiesImpactType currentType;

  @override
  List<Object?> get props => [currentType];
}

final class MatchPenaltyModalRoute extends AppRoute implements KaiselModalRoute<PenaltyModel> {
  const MatchPenaltyModalRoute({
    required this.improvisationId,
    required this.teams,
    required this.integrationPenaltyTypes,
    this.penalty,
  });

  final int improvisationId;
  final List<TeamModel> teams;
  final List<String>? integrationPenaltyTypes;
  final PenaltyModel? penalty;

  @override
  List<Object?> get props => [improvisationId, teams, integrationPenaltyTypes, penalty];
}

final class MatchImprovisationModalRoute extends AppRoute
    implements KaiselModalRoute<(ImprovisationModel, int)> {
  const MatchImprovisationModalRoute({required this.match, this.improvisation});

  final MatchModel match;
  final ImprovisationModel? improvisation;

  @override
  List<Object?> get props => [match, improvisation];
}

enum PacingMenuAction { startMatch, edit, editDetails, share, duplicate, delete }

final class PacingMenuModalRoute extends AppRoute implements KaiselModalRoute<PacingMenuAction> {
  const PacingMenuModalRoute({required this.pacing, this.showEdit = false, this.showEditDetails = false});

  final PacingModel pacing;
  final bool showEdit;
  final bool showEditDetails;

  @override
  List<Object?> get props => [pacing, showEdit, showEditDetails];
}

enum MatchMenuAction { edit, editDetails, delete }

final class MatchMenuModalRoute extends AppRoute implements KaiselModalRoute<MatchMenuAction> {
  const MatchMenuModalRoute({required this.match, this.showEdit = false, this.showEditDetails = false});

  final MatchModel match;
  final bool showEdit;
  final bool showEditDetails;

  @override
  List<Object?> get props => [match, showEdit, showEditDetails];
}

enum TeamMenuAction { edit, share, duplicate, delete }

final class TeamMenuModalRoute extends AppRoute implements KaiselModalRoute<TeamMenuAction> {
  const TeamMenuModalRoute(this.team);

  final TeamModel team;

  @override
  List<Object?> get props => [team];
}

enum ShareMenuAction { shareText, shareFile, saveFile }

final class ShareMenuModalRoute extends AppRoute implements KaiselModalRoute<ShareMenuAction> {
  const ShareMenuModalRoute({this.showShareText = false, this.showShareFile = false, this.showSaveFile = false});

  final bool showShareText;
  final bool showShareFile;
  final bool showSaveFile;

  @override
  List<Object?> get props => [showShareText, showShareFile, showSaveFile];
}

final class MatchScoreboardModalRoute extends AppRoute implements KaiselModalRoute<void> {
  const MatchScoreboardModalRoute(this.match);

  final MatchModel match;

  @override
  List<Object?> get props => [match];
}

final class QuestionModalRoute extends AppRoute implements KaiselModalRoute<bool> {
  const QuestionModalRoute({required this.question, required this.yesLabel, required this.noLabel});

  final String question;
  final String yesLabel;
  final String noLabel;

  @override
  List<Object?> get props => [question, yesLabel, noLabel];
}

final class AlertModalRoute extends AppRoute implements KaiselModalRoute<void> {
  const AlertModalRoute({required this.message, required this.closeLabel});

  final String message;
  final String closeLabel;

  @override
  List<Object?> get props => [message, closeLabel];
}

sealed class PacingsRoute extends KaiselRoute {
  const PacingsRoute();
}

final class PacingsTabRoute extends PacingsRoute {
  const PacingsTabRoute();
}

final class PacingRoute extends PacingsRoute {
  const PacingRoute(this.id);

  final int id;

  @override
  List<Object?> get props => [id];
}

final class PacingsSearchRoute extends PacingsRoute {
  const PacingsSearchRoute();
}

sealed class MatchesRoute extends KaiselRoute {
  const MatchesRoute();
}

final class MatchesTabRoute extends MatchesRoute {
  const MatchesTabRoute();
}

final class MatchRoute extends MatchesRoute {
  const MatchRoute({required this.id, this.improvisationId, this.durationIndex});

  final int id;
  final int? improvisationId;
  final int? durationIndex;

  @override
  List<Object?> get props => [id, improvisationId, durationIndex];
}

final class MatchesSearchRoute extends MatchesRoute {
  const MatchesSearchRoute();
}

sealed class TeamsRoute extends KaiselRoute {
  const TeamsRoute();
}

final class TeamsTabRoute extends TeamsRoute {
  const TeamsTabRoute();
}

final class TeamsSearchRoute extends TeamsRoute {
  const TeamsSearchRoute();
}

sealed class SettingsRoute extends KaiselRoute {
  const SettingsRoute();
}

final class SettingsTabRoute extends SettingsRoute {
  const SettingsTabRoute();
}
