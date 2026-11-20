import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mockito/mockito.dart';
import 'package:mon_pacing/cubits/settings/settings_cubit.dart';
import 'package:mon_pacing/cubits/settings/settings_state.dart';
import 'package:mon_pacing/l10n/generated/app_localizations.dart';
import 'package:mon_pacing/models/improvisation_model.dart';
import 'package:mon_pacing/models/improvisation_type.dart';
import 'package:mon_pacing/models/match_model.dart';
import 'package:mon_pacing/models/pacing_model.dart';
import 'package:mon_pacing/models/penalties_impact_type.dart';
import 'package:mon_pacing/models/penalty_model.dart';
import 'package:mon_pacing/models/team_model.dart';
import 'package:mon_pacing/models/theme_type.dart';
import 'package:mon_pacing/router/routes.dart';
import 'package:mon_pacing/services/router_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late RouterService routerService;

  setUp(() {
    routerService = RouterService(onboardingFinished: () => true, observers: () => []);
  });

  tearDown(() {
    routerService.dispose();
  });

  Future<RouterService> pumpRouter(
    WidgetTester tester, {
    EdgeInsets padding = EdgeInsets.zero,
    EdgeInsets viewInsets = EdgeInsets.zero,
  }) async {
    final service = RouterService(onboardingFinished: () => false, observers: () => []);
    addTearDown(service.dispose);
    await tester.pumpWidget(
      BlocProvider<SettingsCubit>.value(
        value: _TestSettingsCubit(),
        child: MaterialApp.router(
          routerConfig: service.routerConfig,
          localizationsDelegates: S.localizationsDelegates,
          supportedLocales: S.supportedLocales,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(padding: padding, viewInsets: viewInsets),
            child: child!,
          ),
        ),
      ),
    );
    return service;
  }

  test('showPacingDetails resets the root and selects the pacing branch', () async {
    final rootRouter = routerService.rootRouter;
    final shell = routerService.appShell;
    final pacingsRouter = routerService.pacingsRouter;
    await rootRouter.push(const ScannerRoute());

    await routerService.showPacingDetails(42);

    expect(rootRouter.stack, const [TabsRoute()]);
    expect(shell.activeBranch, 0);
    expect(pacingsRouter.stack, const [PacingsTabRoute(), PacingRoute(42)]);
  });

  test('uses onboarding as the initial route and blocks non-onboarding navigation', () async {
    var onboardingFinished = false;
    final onboardingRouter = RouterService(onboardingFinished: () => onboardingFinished, observers: () => []);
    addTearDown(onboardingRouter.dispose);

    expect(onboardingRouter.rootRouter.stack, const [OnboardingRoute()]);

    await onboardingRouter.rootRouter.push(const ScannerRoute());
    expect(onboardingRouter.rootRouter.stack, const [OnboardingRoute()]);

    onboardingFinished = true;
    await onboardingRouter.rootRouter.push(const ScannerRoute());
    expect(onboardingRouter.rootRouter.stack, const [OnboardingRoute(), ScannerRoute()]);
  });

  test('uses tabs as the initial route after onboarding', () {
    expect(routerService.rootRouter.stack, const [TabsRoute()]);
  });

  test('showMatchDetails selects the match branch and preserves timer details', () async {
    final rootRouter = routerService.rootRouter;
    final shell = routerService.appShell;
    final matchesRouter = routerService.matchesRouter;
    await rootRouter.push(const ScannerRoute());

    await routerService.showMatchDetails(id: 21, improvisationId: 4, durationIndex: 2);

    expect(rootRouter.stack, const [TabsRoute()]);
    expect(shell.activeBranch, 1);
    expect(matchesRouter.stack, const [MatchesTabRoute(), MatchRoute(id: 21, improvisationId: 4, durationIndex: 2)]);
  });

  test('replaceMatchDetails replaces only the current match detail', () async {
    final matchesRouter = routerService.matchesRouter;
    await matchesRouter.set(const [MatchesTabRoute(), MatchRoute(id: 3)]);

    await routerService.replaceMatchDetails(id: 7, improvisationId: 1);

    expect(matchesRouter.stack, const [MatchesTabRoute(), MatchRoute(id: 7, improvisationId: 1)]);
  });

  test('resetBranch resets the specified branch to its root', () async {
    final pacingsRouter = routerService.pacingsRouter;
    await pacingsRouter.set(const [PacingsTabRoute(), PacingRoute(12)]);

    await routerService.resetBranch(0);

    expect(pacingsRouter.stack, const [PacingsTabRoute()]);
  });

  test('resetBranch resets each supported branch', () async {
    await routerService.pacingsRouter.set(const [PacingsTabRoute(), PacingRoute(1)]);
    await routerService.matchesRouter.set(const [MatchesTabRoute(), MatchRoute(id: 2)]);
    await routerService.teamsRouter.set(const [TeamsTabRoute(), TeamsSearchRoute()]);
    await routerService.settingsRouter.set(const [SettingsTabRoute(), SettingsTabRoute()]);

    for (var branch = 0; branch < 4; branch++) {
      await routerService.resetBranch(branch);
    }

    expect(routerService.pacingsRouter.stack, const [PacingsTabRoute()]);
    expect(routerService.matchesRouter.stack, const [MatchesTabRoute()]);
    expect(routerService.teamsRouter.stack, const [TeamsTabRoute()]);
    expect(routerService.settingsRouter.stack, const [SettingsTabRoute()]);
  });

  test('detail navigation preserves unrelated branch state', () async {
    await routerService.teamsRouter.set(const [TeamsTabRoute(), TeamsSearchRoute()]);

    await routerService.showMatchDetails(id: 3);

    expect(routerService.teamsRouter.stack, const [TeamsTabRoute(), TeamsSearchRoute()]);
  });

  test('duration picker modal returns its selected value', () async {
    final result = routerService.showDurationPickerModal(
      title: 'Duration',
      initialDuration: const Duration(minutes: 1),
    );

    await Future<void>.delayed(Duration.zero);
    routerService.rootRouter.completeFlow(const Duration(seconds: 45));

    expect(await result, const Duration(seconds: 45));
  });

  test('modal flows resolve independently in nested order', () async {
    final outer = routerService.showThemeModal(ThemeType.light);
    await Future<void>.delayed(Duration.zero);
    final inner = routerService.showDurationPickerModal(title: 'Duration', initialDuration: const Duration(minutes: 1));
    await Future<void>.delayed(Duration.zero);

    routerService.rootRouter.completeFlow(const Duration(seconds: 30));
    expect(await inner, const Duration(seconds: 30));

    routerService.rootRouter.completeFlow(ThemeType.dark);
    expect(await outer, ThemeType.dark);
  });

  test('menu modal returns the selected action', () async {
    final result = routerService.showShareMenuModal(showShareFile: true);

    await Future<void>.delayed(Duration.zero);
    routerService.rootRouter.completeFlow(ShareMenuAction.shareFile);

    expect(await result, ShareMenuAction.shareFile);
  });

  test('question modal returns its answer', () async {
    final result = routerService.showQuestion(question: 'Continue?', yesLabel: 'Yes', noLabel: 'No');

    await Future<void>.delayed(Duration.zero);
    expect(
      routerService.rootRouter.activeFlows.single.route,
      const QuestionModalRoute(question: 'Continue?', yesLabel: 'Yes', noLabel: 'No'),
    );
    routerService.rootRouter.completeFlow(true);

    expect(await result, isTrue);
  });

  testWidgets('pacing menu can open a confirmation immediately after selection', (tester) async {
    final service = await pumpRouter(tester);
    final menu = service.showPacingMenuModal(pacing: _pacing);
    final confirmation = menu.then(
      (_) => service.showQuestion(question: 'Delete pacing?', yesLabel: 'Yes', noLabel: 'No'),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Delete'));
    await tester.pump();
    expect(service.rootRouter.hasActiveFlow, isFalse);
    await tester.pumpAndSettle();
    expect(find.text('Delete pacing?'), findsOneWidget);
    final surface = find.descendant(
      of: find.byType(AlertDialog),
      matching: find.byWidgetPredicate((widget) => widget is Material && widget.type == MaterialType.card),
    );
    final screen = tester.getRect(find.byKey(service.routerConfig.navigatorKey));
    final dialog = tester.getRect(surface);
    expect(dialog.center.dx, closeTo(screen.center.dx, 0.01));
    expect(dialog.center.dy, closeTo(screen.center.dy, 0.01));
    await tester.tap(find.text('No'));
    await tester.pumpAndSettle();
    expect(await menu, PacingMenuAction.delete);
    expect(await confirmation, isFalse);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('alert is centered on screen when opened through the router', (tester) async {
    final service = await pumpRouter(tester, padding: const EdgeInsets.fromLTRB(30, 80, 10, 20));
    final alert = service.showAlert(message: 'Message', closeLabel: 'Close');
    await tester.pumpAndSettle();
    expect(find.byType(Navigator), findsOneWidget);
    final surface = find.descendant(
      of: find.byType(AlertDialog),
      matching: find.byWidgetPredicate((widget) => widget is Material && widget.type == MaterialType.card),
    );
    final screen = tester.getRect(find.byKey(service.routerConfig.navigatorKey));
    final dialog = tester.getRect(surface);
    expect(dialog.center.dx, closeTo(screen.center.dx, 0.01));
    expect(dialog.center.dy, closeTo(screen.center.dy, 0.01));
    await tester.tap(find.text('Close'));
    await tester.pumpAndSettle();
    await alert;
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('routed alert stays above the keyboard', (tester) async {
    final service = await pumpRouter(
      tester,
      padding: const EdgeInsets.only(top: 40),
      viewInsets: const EdgeInsets.only(bottom: 240),
    );
    final alert = service.showAlert(message: 'Message', closeLabel: 'Close');
    await tester.pumpAndSettle();
    final surface = find.descendant(
      of: find.byType(AlertDialog),
      matching: find.byWidgetPredicate((widget) => widget is Material && widget.type == MaterialType.card),
    );
    final screen = tester.getRect(find.byKey(service.routerConfig.navigatorKey));
    final dialog = tester.getRect(surface);
    expect(dialog.bottom, lessThanOrEqualTo(screen.bottom - 240));
    expect(dialog.center.dy, closeTo(screen.center.dy - 120, 0.01));
    await tester.tap(find.text('Close'));
    await tester.pumpAndSettle();
    await alert;
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('routed alert can be dismissed by tapping outside it', (tester) async {
    final service = await pumpRouter(tester, padding: const EdgeInsets.fromLTRB(30, 80, 10, 20));
    for (final outside in [const Offset(10, 300), const Offset(50, 300)]) {
      final alert = service.showAlert(message: 'Message', closeLabel: 'Close');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Message'));
      await tester.pumpAndSettle();
      expect(find.text('Message'), findsOneWidget);
      await tester.tapAt(outside);
      await tester.pumpAndSettle();
      expect(find.text('Message'), findsNothing);
      await alert;
    }
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('system back dismisses a routed alert', (tester) async {
    final service = await pumpRouter(tester);
    final alert = service.showAlert(message: 'Message', closeLabel: 'Close');
    await tester.pumpAndSettle();
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.text('Message'), findsNothing);
    await alert;
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('pacing menu can open the share menu immediately after selection', (tester) async {
    final service = await pumpRouter(tester);
    final menu = service.showPacingMenuModal(pacing: _pacing);
    final share = menu.then((_) => service.showShareMenuModal(showShareText: true));

    await tester.pumpAndSettle();
    await tester.tap(find.text('Share'));
    await tester.pumpAndSettle();
    expect(find.text('Share text'), findsOneWidget);
    await tester.tap(find.text('Share text'));
    await tester.pumpAndSettle();

    expect(await menu, PacingMenuAction.share);
    expect(await share, ShareMenuAction.shareText);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('a nested flow can be followed by another without closing its parent', (tester) async {
    final service = await pumpRouter(tester);
    final menu = service.showPacingMenuModal(pacing: _pacing);
    await tester.pumpAndSettle();

    final question = service.showQuestion(question: 'Continue?', yesLabel: 'Yes', noLabel: 'No');
    final alert = question.then((_) => service.showAlert(message: 'Done', closeLabel: 'Close'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Yes'));
    await tester.pumpAndSettle();
    expect(find.text('Done'), findsOneWidget);
    await tester.tap(find.text('Close'));
    await tester.pumpAndSettle();
    expect(await question, isTrue);
    await alert;

    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();
    expect(await menu, PacingMenuAction.delete);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('dismissing a nested question leaves the pacing menu open', (tester) async {
    final service = await pumpRouter(tester);
    final menu = service.showPacingMenuModal(pacing: _pacing);
    await tester.pumpAndSettle();
    final question = service.showQuestion(question: 'Continue?', yesLabel: 'Yes', noLabel: 'No');
    await tester.pumpAndSettle();

    await tester.tapAt(const Offset(50, 300));
    await tester.pumpAndSettle();
    expect(await question, isNull);
    expect(find.text('Continue?'), findsNothing);
    expect(find.text('Delete'), findsOneWidget);

    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();
    expect(await menu, PacingMenuAction.delete);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('a message box can be shown over another message box', (tester) async {
    final service = await pumpRouter(tester);
    final question = service.showQuestion(question: 'Continue?', yesLabel: 'Yes', noLabel: 'No');
    await tester.pumpAndSettle();
    final alert = service.showAlert(message: 'Notice', closeLabel: 'Close');
    await tester.pumpAndSettle();

    await tester.tap(find.text('Close'));
    await tester.pumpAndSettle();
    await alert;
    expect(find.text('Continue?'), findsOneWidget);
    await tester.tap(find.text('Yes'));
    await tester.pumpAndSettle();
    expect(await question, isTrue);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  test('alert modal resolves when dismissed', () async {
    final result = routerService.showAlert(message: 'Message', closeLabel: 'Close');

    await Future<void>.delayed(Duration.zero);
    routerService.rootRouter.dismissFlow();

    expect(result, completes);
  });

  test('dispose resolves pending modal flows', () async {
    final service = RouterService(onboardingFinished: () => true, observers: () => []);
    final result = service.showQuestion(question: 'Continue?', yesLabel: 'Yes', noLabel: 'No');
    await Future<void>.delayed(Duration.zero);

    service.dispose();

    expect(await result, isNull);
  });

  group('modal entry points', () {
    Future<void> expectDismissed<T>(Future<T?> future, AppRoute expectedRoute) async {
      expect(routerService.rootRouter.activeFlows.last.route, expectedRoute);
      routerService.rootRouter.dismissFlow();
      expect(await future, isNull);
      expect(routerService.rootRouter.hasActiveFlow, isFalse);
    }

    test('map detail editors to their typed routes', () async {
      await expectDismissed(
        routerService.showPacingDetailModal(pacing: _pacing, editMode: true),
        PacingDetailModalRoute(pacing: _pacing, editMode: true),
      );
      await expectDismissed(
        routerService.showMatchDetailModal(match: _match, pacing: _pacing),
        MatchDetailModalRoute(match: _match, pacing: _pacing),
      );
      await expectDismissed(
        routerService.showTeamDetailModal(team: _team, editMode: false),
        TeamDetailModalRoute(team: _team, editMode: false),
      );
    });

    test('map picker and selection flows to their typed routes', () async {
      await expectDismissed(
        routerService.showColorPickerModal(title: 'Color', initialColor: Colors.red),
        const ColorPickerModalRoute(title: 'Color', initialColor: Colors.red),
      );
      await expectDismissed(
        routerService.showLanguageModal(
          currentLocale: const Locale('en'),
          availableLocales: const [Locale('en'), Locale('fr')],
        ),
        const LanguageModalRoute(currentLocale: Locale('en'), availableLocales: [Locale('en'), Locale('fr')]),
      );
      await expectDismissed(routerService.showThemeModal(ThemeType.dark), const ThemeModalRoute(ThemeType.dark));
      await expectDismissed(
        routerService.showPenaltiesImpactTypeModal(PenaltiesImpactType.substractPoints),
        const PenaltiesImpactTypeModalRoute(PenaltiesImpactType.substractPoints),
      );
    });

    test('map match form flows to their typed routes', () async {
      const penalty = PenaltyModel(
        id: 1,
        major: false,
        type: 'Delay',
        performerId: null,
        teamId: 1,
        improvisationId: 2,
      );
      await expectDismissed(
        routerService.showMatchPenaltyModal(
          improvisationId: 2,
          teams: const [_team],
          integrationPenaltyTypes: const ['Delay'],
          penalty: penalty,
        ),
        const MatchPenaltyModalRoute(
          improvisationId: 2,
          teams: [_team],
          integrationPenaltyTypes: ['Delay'],
          penalty: penalty,
        ),
      );
      await expectDismissed(
        routerService.showMatchImprovisationModal(match: _match, improvisation: _improvisation),
        MatchImprovisationModalRoute(match: _match, improvisation: _improvisation),
      );
    });

    test('map action menus to their typed routes', () async {
      await expectDismissed(
        routerService.showPacingMenuModal(pacing: _pacing, showEdit: true),
        PacingMenuModalRoute(pacing: _pacing, showEdit: true),
      );
      await expectDismissed(
        routerService.showMatchMenuModal(match: _match, showEditDetails: true),
        MatchMenuModalRoute(match: _match, showEditDetails: true),
      );
      await expectDismissed(routerService.showTeamMenuModal(_team), const TeamMenuModalRoute(_team));
      await expectDismissed(
        routerService.showShareMenuModal(showShareFile: true),
        const ShareMenuModalRoute(showShareFile: true),
      );
    });

    test('maps scoreboard to its typed route', () async {
      final result = routerService.showMatchScoreboardModal(_match);
      expect(routerService.rootRouter.activeFlows.single.route, MatchScoreboardModalRoute(_match));

      routerService.rootRouter.dismissFlow();

      await expectLater(result, completes);
      expect(routerService.rootRouter.hasActiveFlow, isFalse);
    });
  });
}

class _TestSettingsCubit extends Mock implements SettingsCubit {
  @override
  SettingsState get state => const SettingsState(language: 'en', theme: ThemeType.light);

  @override
  Stream<SettingsState> get stream => const Stream.empty();
}

const _team = TeamModel(id: 1, createdDate: null, modifiedDate: null, name: 'Team', color: 0xff0000ff);

const _improvisation = ImprovisationModel(
  id: 1,
  type: ImprovisationType.mixed,
  category: 'Category',
  theme: 'Theme',
  durationsInSeconds: [180],
  performers: 'Unlimited',
  notes: '',
);

const _pacing = PacingModel(
  id: 2,
  name: 'Pacing',
  createdDate: null,
  modifiedDate: null,
  improvisations: [_improvisation],
);

const _match = MatchModel(
  id: 3,
  name: 'Match',
  createdDate: null,
  modifiedDate: null,
  teams: [_team],
  improvisations: [_improvisation],
  penalties: [],
  points: [],
);
