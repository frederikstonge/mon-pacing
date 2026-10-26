import 'package:kaisel/kaisel.dart';

import 'routes.dart';

final pacingsRouter = KaiselRouter<PacingsRoute>(initial: const PacingsTabRoute());
final matchesRouter = KaiselRouter<MatchesRoute>(initial: const MatchesTabRoute());
final teamsRouter = KaiselRouter<TeamsRoute>(initial: const TeamsTabRoute());
final settingsRouter = KaiselRouter<SettingsRoute>(initial: const SettingsTabRoute());

final appShell = BranchedShellRouter(branches: [pacingsRouter, matchesRouter, teamsRouter, settingsRouter]);

class AppRouteCodec implements KaiselConfigCodec<AppRoute> {
  const AppRouteCodec();

  @override
  Uri encode(KaiselConfig<AppRoute> config) {
    return switch ((config.mainStack.last, config.nestedState)) {
      (OnboardingRoute(), _) => Uri(path: '/onboarding'),
      (ScannerRoute(), _) => Uri(path: '/scanner'),
      (CategoriesSearchRoute(), _) => Uri(path: '/categories/search'),
      (PenaltiesSearchRoute(), _) => Uri(path: '/penalties/search'),
      (TagsSearchRoute(), _) => Uri(path: '/tags/search'),
      (TabsRoute(), KaiselShellConfig(:final activeBranch, :final activeBranchStack)) => _encodeBranch(
        activeBranch,
        activeBranchStack,
      ),
      (TabsRoute(), null) => Uri(path: '/pacings'),
      (TabsRoute(), _) => throw StateError('Tabs route has an unsupported nested configuration.'),
    };
  }

  @override
  KaiselConfig<AppRoute>? decode(Uri uri) {
    final segments = uri.pathSegments;
    switch (segments) {
      case ['onboarding']:
        return KaiselConfig<AppRoute>(mainStack: const [OnboardingRoute()]);
      case ['scanner']:
        return KaiselConfig<AppRoute>(mainStack: const [TabsRoute(), ScannerRoute()]);
      case ['categories', 'search']:
        return KaiselConfig<AppRoute>(mainStack: const [TabsRoute(), CategoriesSearchRoute()]);
      case ['penalties', 'search']:
        return KaiselConfig<AppRoute>(mainStack: const [TabsRoute(), PenaltiesSearchRoute()]);
      case ['tags', 'search']:
        return KaiselConfig<AppRoute>(mainStack: const [TabsRoute(), TagsSearchRoute()]);
      case ['pacings']:
        return _shellConfig(0, const [PacingsTabRoute()]);
      case ['pacings', 'details', final rawId]:
        final id = int.tryParse(rawId);
        return id == null ? null : _shellConfig(0, [const PacingsTabRoute(), PacingDetailsRoute(id)]);
      case ['pacings', 'search']:
        return _shellConfig(0, const [PacingsTabRoute(), PacingsSearchRoute()]);
      case ['matches']:
        return _shellConfig(1, const [MatchesTabRoute()]);
      case ['matches', 'details', final rawId]:
        final id = int.tryParse(rawId);
        final improvisationId = _optionalInt(uri, 'improvisationId');
        final durationIndex = _optionalInt(uri, 'durationIndex');
        if (id == null ||
            _isInvalidOptionalInt(uri, 'improvisationId') ||
            _isInvalidOptionalInt(uri, 'durationIndex')) {
          return null;
        }
        return _shellConfig(1, [
          const MatchesTabRoute(),
          MatchDetailsRoute(id: id, improvisationId: improvisationId, durationIndex: durationIndex),
        ]);
      case ['matches', 'search']:
        return _shellConfig(1, const [MatchesTabRoute(), MatchesSearchRoute()]);
      case ['teams']:
        return _shellConfig(2, const [TeamsTabRoute()]);
      case ['teams', 'search']:
        return _shellConfig(2, const [TeamsTabRoute(), TeamsSearchRoute()]);
      case ['settings']:
        return _shellConfig(3, const [SettingsTabRoute()]);
      default:
        return null;
    }
  }

  KaiselConfig<AppRoute> _shellConfig(int branch, List<KaiselRoute> stack) {
    return KaiselConfig<AppRoute>(
      mainStack: const [TabsRoute()],
      nestedState: KaiselShellConfig(activeBranch: branch, activeBranchStack: stack),
    );
  }

  Uri _encodeBranch(int branch, List<KaiselRoute> stack) {
    return switch ((branch, stack)) {
      (0, [PacingsTabRoute()]) => Uri(path: '/pacings'),
      (0, [PacingsTabRoute(), PacingDetailsRoute(:final id)]) => Uri(path: '/pacings/details/$id'),
      (0, [PacingsTabRoute(), PacingsSearchRoute()]) => Uri(path: '/pacings/search'),
      (1, [MatchesTabRoute()]) => Uri(path: '/matches'),
      (1, [MatchesTabRoute(), MatchDetailsRoute(:final id, :final improvisationId, :final durationIndex)]) => _matchUri(
        id,
        improvisationId,
        durationIndex,
      ),
      (1, [MatchesTabRoute(), MatchesSearchRoute()]) => Uri(path: '/matches/search'),
      (2, [TeamsTabRoute()]) => Uri(path: '/teams'),
      (2, [TeamsTabRoute(), TeamsSearchRoute()]) => Uri(path: '/teams/search'),
      (3, [SettingsTabRoute()]) => Uri(path: '/settings'),
      _ => throw StateError('Cannot encode branch $branch with stack $stack.'),
    };
  }

  Uri _matchUri(int id, int? improvisationId, int? durationIndex) {
    final queryParameters = {
      if (improvisationId != null) 'improvisationId': '$improvisationId',
      if (durationIndex != null) 'durationIndex': '$durationIndex',
    };
    return Uri(path: '/matches/details/$id', queryParameters: queryParameters.isEmpty ? null : queryParameters);
  }

  int? _optionalInt(Uri uri, String key) {
    final value = uri.queryParameters[key];
    return value == null ? null : int.tryParse(value);
  }

  bool _isInvalidOptionalInt(Uri uri, String key) {
    final value = uri.queryParameters[key];
    return value != null && int.tryParse(value) == null;
  }
}
