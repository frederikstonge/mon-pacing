import 'package:flutter_test/flutter_test.dart';
import 'package:kaisel/kaisel.dart';
import 'package:mon_pacing/router/router.dart';
import 'package:mon_pacing/router/routes.dart';

void main() {
  const codec = MatchNotificationCodec();

  group('MatchNotificationCodec', () {
    test('decodes match notification routes with timer state', () {
      final config = codec.decode(Uri.parse('/matches/details/34?improvisationId=7&durationIndex=2'));

      expect(config, isNotNull);
      expect((config!.nestedState as KaiselShellConfig).activeBranchStack, const [
        MatchesTabRoute(),
        MatchRoute(id: 34, improvisationId: 7, durationIndex: 2),
      ]);
    });

    test('encodes only match detail routes', () {
      final matchConfig = codec.decode(Uri.parse('/matches/details/34?durationIndex=2'))!;
      final otherConfig = codec.decode(Uri.parse('/matches')) ?? KaiselConfig<AppRoute>(mainStack: const [TabsRoute()]);

      expect(codec.encode(matchConfig), Uri.parse('/matches/details/34?durationIndex=2'));
      expect(codec.encode(otherConfig), Uri.parse('/'));
    });

    test('ignores routes other than match details and rejects malformed match routes', () {
      expect(codec.decode(Uri.parse('/pacings')), isNull);
      expect(codec.decode(Uri.parse('/pacings/details/nope')), isNull);
      expect(codec.decode(Uri.parse('/matches/details/nope')), isNull);
      expect(codec.decode(Uri.parse('/matches/details/34?durationIndex=nope')), isNull);
    });

    test('decodes routes with omitted optional state', () {
      final config = codec.decode(Uri.parse('/matches/details/34'));
      final shell = config!.nestedState as KaiselShellConfig;

      expect(config.mainStack, const [TabsRoute()]);
      expect(shell.activeBranch, 1);
      expect(shell.activeBranchStack, const [
        MatchesTabRoute(),
        MatchRoute(id: 34),
      ]);
    });

    test('rejects incomplete, extra-segment, and malformed query routes', () {
      expect(codec.decode(Uri.parse('/matches/details')), isNull);
      expect(codec.decode(Uri.parse('/matches/details/34/extra')), isNull);
      expect(codec.decode(Uri.parse('/matches/details/34?improvisationId=nope')), isNull);
      expect(codec.decode(Uri.parse('/matches/details/34?durationIndex=')), isNull);
    });

    test('encodes both optional timer fields in stable order', () {
      final config = codec.decode(
        Uri.parse('/matches/details/34?improvisationId=7&durationIndex=2'),
      )!;

      expect(
        codec.encode(config),
        Uri.parse('/matches/details/34?improvisationId=7&durationIndex=2'),
      );
    });

    test('encodes to root when the active shell stack is not an exact match detail', () {
      final configs = [
        KaiselConfig<AppRoute>(
          mainStack: const [TabsRoute()],
          nestedState: KaiselShellConfig(
            activeBranch: 0,
            activeBranchStack: const [PacingsTabRoute(), PacingRoute(1)],
          ),
        ),
        KaiselConfig<AppRoute>(
          mainStack: const [TabsRoute()],
          nestedState: KaiselShellConfig(
            activeBranch: 1,
            activeBranchStack: const [MatchesTabRoute()],
          ),
        ),
      ];

      for (final config in configs) {
        expect(codec.encode(config), Uri(path: '/'));
      }
    });
  });
}
