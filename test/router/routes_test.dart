import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mon_pacing/router/routes.dart';

void main() {
  test('parameterless routes compare by runtime type', () {
    expect(const TabsRoute(), const TabsRoute());
    expect(const TabsRoute(), isNot(const ScannerRoute()));
  });

  test('pacing and match routes compare every route parameter', () {
    expect(const PacingRoute(12), const PacingRoute(12));
    expect(const PacingRoute(12), isNot(const PacingRoute(13)));
    expect(
      const MatchRoute(id: 12, improvisationId: 3, durationIndex: 2),
      const MatchRoute(id: 12, improvisationId: 3, durationIndex: 2),
    );
    expect(
      const MatchRoute(id: 12, improvisationId: 3, durationIndex: 2),
      isNot(const MatchRoute(id: 12, improvisationId: 4, durationIndex: 2)),
    );
  });

  test('modal routes compare list-valued parameters by content', () {
    expect(
      const LanguageModalRoute(currentLocale: Locale('en'), availableLocales: [Locale('en'), Locale('fr')]),
      const LanguageModalRoute(currentLocale: Locale('en'), availableLocales: [Locale('en'), Locale('fr')]),
    );
    expect(
      const LanguageModalRoute(currentLocale: Locale('en'), availableLocales: [Locale('en')]),
      isNot(const LanguageModalRoute(currentLocale: Locale('en'), availableLocales: [Locale('fr')])),
    );
  });
}
