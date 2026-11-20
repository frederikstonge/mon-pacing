import 'package:kaisel/kaisel.dart';

import '../models/match_model.dart';
import '../models/pacing_model.dart';

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
