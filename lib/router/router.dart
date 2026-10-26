import 'package:kaisel/kaisel.dart';

import 'routes.dart';

class MatchNotificationCodec implements KaiselConfigCodec<AppRoute> {
  const MatchNotificationCodec();

  @override
  Uri encode(KaiselConfig<AppRoute> config) {
    return switch ((config.mainStack.last, config.nestedState)) {
      (
        TabsRoute(),
        KaiselShellConfig(
          activeBranch: 1,
          activeBranchStack: [
            MatchesTabRoute(),
            MatchDetailsRoute(:final id, :final improvisationId, :final durationIndex),
          ],
        ),
      ) =>
        _matchUri(id, improvisationId, durationIndex),
      _ => Uri(path: '/'),
    };
  }

  @override
  KaiselConfig<AppRoute>? decode(Uri uri) {
    if (uri.pathSegments case ['matches', 'details', final rawId]) {
      final id = int.tryParse(rawId);
      final improvisationId = _optionalInt(uri, 'improvisationId');
      final durationIndex = _optionalInt(uri, 'durationIndex');
      if (id == null || _isInvalidOptionalInt(uri, 'improvisationId') || _isInvalidOptionalInt(uri, 'durationIndex')) {
        return null;
      }
      return KaiselConfig<AppRoute>(
        mainStack: const [TabsRoute()],
        nestedState: KaiselShellConfig(
          activeBranch: 1,
          activeBranchStack: [
            const MatchesTabRoute(),
            MatchDetailsRoute(id: id, improvisationId: improvisationId, durationIndex: durationIndex),
          ],
        ),
      );
    }
    return null;
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
