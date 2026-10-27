import 'package:kaisel/kaisel.dart';

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

sealed class PacingsRoute extends KaiselRoute {
  const PacingsRoute();
}

final class PacingsTabRoute extends PacingsRoute {
  const PacingsTabRoute();
}

final class PacingDetailsRoute extends PacingsRoute {
  const PacingDetailsRoute(this.id);

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

final class MatchDetailsRoute extends MatchesRoute {
  const MatchDetailsRoute({required this.id, this.improvisationId, this.durationIndex});

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
