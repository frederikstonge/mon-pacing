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
        MatchDetailsRoute(id: 34, improvisationId: 7, durationIndex: 2),
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
  });
}
