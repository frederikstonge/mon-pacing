import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mockito/mockito.dart';
import 'package:mon_pacing/cubits/settings/settings_cubit.dart';
import 'package:mon_pacing/cubits/settings/settings_state.dart';
import 'package:mon_pacing/cubits/timer/timer_cubit.dart';
import 'package:mon_pacing/cubits/timer/timer_state.dart';
import 'package:mon_pacing/l10n/generated/app_localizations.dart';
import 'package:mon_pacing/models/improvisation_model.dart';
import 'package:mon_pacing/models/improvisation_type.dart';
import 'package:mon_pacing/models/match_model.dart';
import 'package:mon_pacing/models/penalty_model.dart';
import 'package:mon_pacing/models/team_model.dart';
import 'package:mon_pacing/models/theme_type.dart';
import 'package:mon_pacing/models/timer_model.dart';
import 'package:mon_pacing/models/timer_status.dart';
import 'package:mon_pacing/pages/match/cubits/match_cubit.dart';
import 'package:mon_pacing/pages/match/cubits/match_state.dart';
import 'package:mon_pacing/pages/match/cubits/match_status.dart';
import 'package:mon_pacing/pages/match/match_page_view.dart';
import 'package:mon_pacing/pages/match/widgets/improvisation_statistics.dart';
import 'package:mon_pacing/themes/themes.dart';

import '../screenshots/generate_screenshots_test.mocks.dart';

void main() {
  setUpAll(() async {
    final font = FontLoader('Poppins')
      ..addFont(rootBundle.load('fonts/Poppins-Regular.ttf'))
      ..addFont(rootBundle.load('fonts/Poppins-Medium.ttf'))
      ..addFont(rootBundle.load('fonts/Poppins-SemiBold.ttf'));
    await font.load();
  });
  for (final (active, locale) in [
    (false, const Locale('en')),
    (true, const Locale('en')),
    (false, const Locale('fr')),
    (true, const Locale('fr')),
  ]) {
    testWidgets('representative match fits a 360 x 800 phone without scrolling (active: $active, $locale)', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      const improvisation = ImprovisationModel(
        id: 1,
        type: ImprovisationType.mixed,
        category: 'Comedy',
        theme: 'A new beginning',
        durationsInSeconds: [120],
        performers: '2',
        notes: 'One line of notes',
      );
      const match = MatchModel(
        id: 1,
        name: 'Match',
        createdDate: null,
        modifiedDate: null,
        teams: [
          TeamModel(id: 1, name: 'Red', color: 0xffdd0000, createdDate: null, modifiedDate: null),
          TeamModel(id: 2, name: 'Blue', color: 0xff0000dd, createdDate: null, modifiedDate: null),
        ],
        improvisations: [improvisation],
        points: [],
        penalties: [PenaltyModel(id: 1, major: false, type: 'Delay', performerId: null, teamId: 1, improvisationId: 1)],
      );
      final settings = MockSettingsCubit();
      final timer = MockTimerCubit();
      final matchCubit = MockMatchCubit();
      when(settings.state).thenReturn(const SettingsState(language: 'en', theme: ThemeType.light));
      when(timer.pause()).thenAnswer((_) async {});
      when(timer.stop()).thenAnswer((_) async {});
      when(timer.start(any, any, any, any)).thenAnswer((_) async {});
      when(timer.state).thenReturn(
        TimerState(
          timer: active
              ? const TimerModel(
                  durationInSeconds: 30,
                  matchId: 1,
                  improvisationId: 1,
                  durationIndex: 0,
                  status: TimerStatus.started,
                  remainingMilliseconds: 25000,
                  hapticFeedback: false,
                  notificationTitle: 'Match',
                )
              : null,
        ),
      );
      when(matchCubit.state)
          .thenReturn(MatchState(status: MatchStatus.success, match: match, selectedDurationIndex: active ? 0 : null));

      final app = MultiBlocProvider(
        providers: [
          BlocProvider<SettingsCubit>.value(value: settings),
          BlocProvider<TimerCubit>.value(value: timer),
          BlocProvider<MatchCubit>.value(value: matchCubit),
        ],
        child: MaterialApp(
          theme: Themes.light(),
          locale: locale,
          localizationsDelegates: [S.delegate, ...GlobalMaterialLocalizations.delegates],
          supportedLocales: S.supportedLocales,
          home: Builder(
            builder: (context) => MediaQuery(
              data: MediaQuery.of(context).copyWith(
                padding: const EdgeInsets.only(top: 24, bottom: 24),
                viewPadding: const EdgeInsets.only(top: 24, bottom: 24),
              ),
              child: const MatchPageView(),
            ),
          ),
        ),
      );
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      expect(find.text('Delay'), findsOneWidget);
      final scrollable = tester.state<ScrollableState>(
        find.ancestor(of: find.byType(ImprovisationStatistics), matching: find.byType(Scrollable)).first,
      );
      expect(scrollable.position.maxScrollExtent, 0);
      expect(tester.takeException(), isNull);
      expect(find.byTooltip(lookupS(locale).reset), findsOneWidget);
      expect(find.byTooltip(lookupS(locale).stop), findsOneWidget);
      if (active) {
        await tester.tap(find.byTooltip(lookupS(locale).pause));
        await tester.pumpAndSettle();
        verify(timer.pause()).called(1);
        await tester.tap(find.byTooltip(lookupS(locale).reset));
        await tester.pumpAndSettle();
        verify(timer.start(match, 1, 0, const Duration(seconds: 30))).called(1);
        await tester.tap(find.byTooltip(lookupS(locale).stop));
        await tester.pumpAndSettle();
        verify(timer.stop()).called(1);
      }
      await tester.tap(find.byIcon(Icons.chevron_right));
      verify(matchCubit.changePage(1)).called(1);
      for (final size in [const Size(800, 360), const Size(800, 1280), const Size(1280, 800)]) {
        tester.view.physicalSize = size;
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull, reason: 'layout at $size');
      }
      tester.view.physicalSize = const Size(360, 800);
      tester.binding.platformDispatcher.textScaleFactorTestValue = 2;
      addTearDown(tester.binding.platformDispatcher.clearTextScaleFactorTestValue);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull, reason: 'large system text');
      tester.view.physicalSize = const Size(800, 360);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull, reason: 'landscape with large system text');

      await tester.pumpWidget(const SizedBox.shrink());
      when(matchCubit.state)
          .thenReturn(MatchState(status: MatchStatus.success, match: match.copyWith(enableStatistics: false)));
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      expect(find.byType(ImprovisationStatistics), findsNothing);
      expect(find.byTooltip(lookupS(locale).addPenalty), findsNothing);
      if (!active && locale.languageCode == 'en') {
        await tester.pumpWidget(const SizedBox.shrink());
        tester.binding.platformDispatcher.clearTextScaleFactorTestValue();
        tester.view.physicalSize = const Size(360, 800);
        final longImprovisation = improvisation.copyWith(
          category: 'A very long category name that should remain readable on a narrow phone',
          notes: List.filled(20, 'Additional notes').join(' '),
        );
        final longMatch = match.copyWith(improvisations: [longImprovisation]);
        when(matchCubit.state).thenReturn(MatchState(status: MatchStatus.success, match: longMatch));
        await tester.pumpWidget(app);
        await tester.pumpAndSettle();
        final overflowScroll = tester.state<ScrollableState>(
          find.ancestor(of: find.byType(ImprovisationStatistics), matching: find.byType(Scrollable)).first,
        );
        expect(overflowScroll.position.maxScrollExtent, greaterThan(0));
        expect(tester.takeException(), isNull);
      }
    });
  }
}
