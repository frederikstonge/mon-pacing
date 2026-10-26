import 'package:flutter_test/flutter_test.dart';
import 'package:mon_pacing/router/router.dart';

void main() {
  const codec = AppRouteCodec();

  group('AppRouteCodec', () {
    test('round trips supported routes', () {
      const locations = [
        '/onboarding',
        '/scanner',
        '/categories/search',
        '/penalties/search',
        '/tags/search',
        '/pacings',
        '/pacings/details/12',
        '/pacings/search',
        '/matches',
        '/matches/details/34?improvisationId=7&durationIndex=2',
        '/matches/search',
        '/teams',
        '/teams/search',
        '/settings',
      ];

      for (final location in locations) {
        final config = codec.decode(Uri.parse(location));

        expect(config, isNotNull, reason: location);
        expect(codec.encode(config!), Uri.parse(location), reason: location);
      }
    });

    test('rejects malformed detail identifiers and query values', () {
      expect(codec.decode(Uri.parse('/pacings/details/nope')), isNull);
      expect(codec.decode(Uri.parse('/matches/details/34?durationIndex=nope')), isNull);
    });
  });
}
