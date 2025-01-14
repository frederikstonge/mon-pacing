@Tags(['screenshot'])
library;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_screenshot/golden_screenshot.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mon_pacing/cubits/feature_flags/feature_flags_cubit.dart';
import 'package:mon_pacing/cubits/feature_flags/feature_flags_state.dart';
import 'package:mon_pacing/cubits/feature_flags/feature_flags_status.dart';
import 'package:mon_pacing/cubits/matches/matches_cubit.dart';
import 'package:mon_pacing/cubits/matches/matches_state.dart';
import 'package:mon_pacing/cubits/matches/matches_status.dart';
import 'package:mon_pacing/cubits/pacings/pacings_cubit.dart';
import 'package:mon_pacing/cubits/pacings/pacings_state.dart';
import 'package:mon_pacing/cubits/pacings/pacings_status.dart';
import 'package:mon_pacing/cubits/settings/settings_cubit.dart';
import 'package:mon_pacing/cubits/settings/settings_state.dart';
import 'package:mon_pacing/cubits/teams/teams_cubit.dart';
import 'package:mon_pacing/cubits/teams/teams_state.dart';
import 'package:mon_pacing/cubits/teams/teams_status.dart';
import 'package:mon_pacing/cubits/timer/timer_cubit.dart';
import 'package:mon_pacing/cubits/timer/timer_state.dart';
import 'package:mon_pacing/extensions/color_extensions.dart';
import 'package:mon_pacing/l10n/generated/app_localizations.dart';
import 'package:mon_pacing/models/improvisation_model.dart';
import 'package:mon_pacing/models/improvisation_type.dart';
import 'package:mon_pacing/models/match_model.dart';
import 'package:mon_pacing/models/match_team_model.dart';
import 'package:mon_pacing/models/pacing_model.dart';
import 'package:mon_pacing/models/team_model.dart';
import 'package:mon_pacing/models/theme_type.dart';
import 'package:mon_pacing/pages/match/cubits/match_cubit.dart';
import 'package:mon_pacing/pages/match/cubits/match_state.dart';
import 'package:mon_pacing/pages/match/cubits/match_status.dart';
import 'package:mon_pacing/pages/match/match_page_view.dart';
import 'package:mon_pacing/pages/matches/matches_page_view.dart';
import 'package:mon_pacing/pages/pacing/cubits/pacing_cubit.dart';
import 'package:mon_pacing/pages/pacing/cubits/pacing_state.dart';
import 'package:mon_pacing/pages/pacing/cubits/pacing_status.dart';
import 'package:mon_pacing/pages/pacing/pacing_page_view.dart';
import 'package:mon_pacing/pages/pacings/pacings_page_view.dart';
import 'package:mon_pacing/pages/settings/settings_page_view.dart';
import 'package:mon_pacing/pages/teams/teams_page_view.dart';
import 'package:mon_pacing/services/analytics_service.dart';
import 'package:mon_pacing/services/excel_service.dart';
import 'package:mon_pacing/services/integration_service.dart';
import 'package:mon_pacing/services/toaster_service.dart';
import 'package:mon_pacing/themes/themes.dart';
import 'package:path/path.dart' as p;

import 'generate_screenshots_test.mocks.dart';
import 'screenshot_devices.dart';
import 'shell_wrapper.dart';

@GenerateNiceMocks([
  MockSpec<ToasterService>(),
  MockSpec<ExcelService>(),
  MockSpec<IntegrationService>(),
  MockSpec<AnalyticsService>(),
  MockSpec<SettingsCubit>(),
  MockSpec<FeatureFlagsCubit>(),
  MockSpec<PacingsCubit>(),
  MockSpec<MatchesCubit>(),
  MockSpec<TeamsCubit>(),
  MockSpec<TimerCubit>(),
  MockSpec<PacingCubit>(),
  MockSpec<MatchCubit>(),
])
late final MockToasterService toasterService;
late final MockExcelService excelService;
late final MockIntegrationService integrationService;
late final MockAnalyticsService analyticsService;

late final MockSettingsCubit settingsCubit;
late final MockFeatureFlagsCubit featureFlagsCubit;
late final MockPacingsCubit pacingsCubit;
late final MockMatchesCubit matchesCubit;
late final MockTeamsCubit teamsCubit;
late final MockTimerCubit timerCubit;
late final MockPacingCubit pacingCubit;
late final MockMatchCubit matchCubit;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    toasterService = MockToasterService();
    excelService = MockExcelService();
    integrationService = MockIntegrationService();
    analyticsService = MockAnalyticsService();

    settingsCubit = MockSettingsCubit();
    featureFlagsCubit = MockFeatureFlagsCubit();
    pacingsCubit = MockPacingsCubit();
    matchesCubit = MockMatchesCubit();
    teamsCubit = MockTeamsCubit();
    timerCubit = MockTimerCubit();
    pacingCubit = MockPacingCubit();
    matchCubit = MockMatchCubit();

    final pacing = PacingModel(
      id: 0,
      name: 'Canadiens vs Maple Leafs',
      tags: ['NHL', 'Hockey'],
      createdDate: DateTime.now(),
      modifiedDate: DateTime.now(),
      improvisations: List.generate(
        12,
        (index) => ImprovisationModel(
          id: index,
          type: ImprovisationType.values.elementAt(index % 2),
          category: '',
          theme: '',
          durationsInSeconds: [Duration(minutes: 2).inSeconds],
          performers: '',
          notes: '',
        ),
      ),
    );

    final teams = [
      TeamModel(
        id: 0,
        createdDate: DateTime.now(),
        modifiedDate: DateTime.now(),
        name: 'Canadiens',
        color: Colors.red.getIntvalue,
      ),
      TeamModel(
        id: 1,
        createdDate: DateTime.now(),
        modifiedDate: DateTime.now(),
        name: 'Maple Leafs',
        color: Colors.blue.getIntvalue,
      )
    ];

    final match = MatchModel(
      id: 0,
      name: 'Canadiens vs Maple Leafs',
      tags: ['NHL', 'Hockey'],
      createdDate: DateTime.now(),
      modifiedDate: DateTime.now(),
      teams: [
        MatchTeamModel(
          id: 0,
          name: 'Canadiens',
          color: Colors.red.getIntvalue,
        ),
        MatchTeamModel(
          id: 1,
          name: 'Maple Leafs',
          color: Colors.blue.getIntvalue,
        ),
      ],
      improvisations: List.generate(
        12,
        (index) => ImprovisationModel(
          id: index,
          type: ImprovisationType.values.elementAt(index % 2),
          category: '',
          theme: '',
          durationsInSeconds: [Duration(minutes: 2).inSeconds],
          performers: '',
          notes: '',
        ),
      ),
      penalties: [],
      points: [],
    );

    when(featureFlagsCubit.state).thenReturn(const FeatureFlagsState(status: FeatureFlagsStatus.success, enableIntegrations: true));
    when(pacingsCubit.state).thenReturn(PacingsState(status: PacingsStatus.success, pacings: [pacing]));
    when(matchesCubit.state).thenReturn(MatchesState(status: MatchesStatus.success, matches: [match]));
    when(teamsCubit.state).thenReturn(TeamsState(status: TeamsStatus.success, teams: teams));
    when(timerCubit.state).thenReturn(const TimerState(timer: null));
    when(pacingCubit.state).thenReturn(PacingState(status: PacingStatus.success, pacing: pacing));
    when(matchCubit.state).thenReturn(MatchState(status: MatchStatus.success, match: match));
  });

  group('Android', () {
    final goldenDevices = [
      CustomGoldenScreenshotDevices.android10InchTablet,
      CustomGoldenScreenshotDevices.android7InchTablet,
      CustomGoldenScreenshotDevices.androidPhone,
    ];

    _screenshotWidget(
      goldenFileName: '1_pacings',
      child: ShellWrapper(
        body: PacingsPageView(),
        selectedIndex: 0,
      ),
      goldenDevices: goldenDevices,
    );

    _screenshotWidget(
      goldenFileName: '2_pacing',
      child: PacingPageView(),
      goldenDevices: goldenDevices,
    );

    _screenshotWidget(
      goldenFileName: '3_matches',
      child: ShellWrapper(
        body: MatchesPageView(),
        selectedIndex: 1,
      ),
      goldenDevices: goldenDevices,
    );

    _screenshotWidget(
      goldenFileName: '4_match',
      child: MatchPageView(),
      goldenDevices: goldenDevices,
    );

    _screenshotWidget(
      goldenFileName: '5_teams',
      child: ShellWrapper(
        body: TeamsPageView(),
        selectedIndex: 2,
      ),
      goldenDevices: goldenDevices,
    );

    _screenshotWidget(
      goldenFileName: '6_settings',
      child: ShellWrapper(
        body: SettingsPageView(),
        selectedIndex: 3,
      ),
      goldenDevices: goldenDevices,
    );
  });

  group('iOS', () {
    final goldenDevices = [
      CustomGoldenScreenshotDevices.iphone,
      CustomGoldenScreenshotDevices.ipad,
    ];

    _screenshotWidget(
      goldenFileName: '1_pacings',
      child: ShellWrapper(
        body: PacingsPageView(),
        selectedIndex: 0,
      ),
      goldenDevices: goldenDevices,
    );

    _screenshotWidget(
      goldenFileName: '2_pacing',
      child: PacingPageView(),
      goldenDevices: goldenDevices,
    );

    _screenshotWidget(
      goldenFileName: '3_matches',
      child: ShellWrapper(
        body: MatchesPageView(),
        selectedIndex: 1,
      ),
      goldenDevices: goldenDevices,
    );

    _screenshotWidget(
      goldenFileName: '4_match',
      child: MatchPageView(),
      goldenDevices: goldenDevices,
    );

    _screenshotWidget(
      goldenFileName: '5_teams',
      child: ShellWrapper(
        body: TeamsPageView(),
        selectedIndex: 2,
      ),
      goldenDevices: goldenDevices,
    );

    _screenshotWidget(
      goldenFileName: '6_settings',
      child: ShellWrapper(
        body: SettingsPageView(),
        selectedIndex: 3,
      ),
      goldenDevices: goldenDevices,
    );
  });
}

void _screenshotWidget({
  required String goldenFileName,
  required Widget child,
  required List<CustomGoldenScreenshotDevices> goldenDevices,
}) {
  group(goldenFileName, () {
    final theme = ThemeType.light;
    for (final goldenDevice in goldenDevices) {
      for (final locale in S.supportedLocales) {
        testWidgets('for ${goldenDevice.name}-${theme.name}-${locale.toLanguageTag()}', (tester) async {
          when(settingsCubit.state).thenReturn(SettingsState(language: locale.toLanguageTag(), theme: theme));
          final device = goldenDevice.device;

          // Enable shadows which are normally disabled in golden tests.
          // Make sure to disable them again at the end of the test.
          debugDisableShadows = false;

          // Build widget tree around our child widget.
          final widget = MultiRepositoryProvider(
            providers: [
              RepositoryProvider<ToasterService>(
                create: (context) => toasterService,
              ),
              RepositoryProvider<ExcelService>(
                create: (context) => excelService,
              ),
              RepositoryProvider<IntegrationService>(
                create: (context) => integrationService,
              ),
              RepositoryProvider<AnalyticsService>(
                create: (context) => analyticsService,
              ),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider<SettingsCubit>(
                  create: (context) => settingsCubit,
                ),
                BlocProvider<FeatureFlagsCubit>(
                  create: (context) => featureFlagsCubit,
                ),
                BlocProvider<PacingsCubit>(
                  create: (context) => pacingsCubit,
                ),
                BlocProvider<MatchesCubit>(
                  create: (context) => matchesCubit,
                ),
                BlocProvider<TeamsCubit>(
                  create: (context) => teamsCubit,
                ),
                BlocProvider<TimerCubit>(
                  create: (context) => timerCubit,
                ),
                BlocProvider<PacingCubit>(
                  create: (context) => pacingCubit,
                ),
                BlocProvider<MatchCubit>(
                  create: (context) => matchCubit,
                ),
              ],
              child: ScreenshotApp(
                theme: switch (theme) {
                  ThemeType.light => Themes.light(),
                  ThemeType.dark => Themes.dark(),
                  ThemeType.lni => Themes.lni(),
                },
                localizationsDelegates: S.localizationsDelegates,
                supportedLocales: S.supportedLocales,
                locale: locale,
                device: device,
                child: child,
              ),
            ),
          );

          await tester.pumpWidget(widget);

          // Precache the images and fonts
          // so they're ready for the screenshot.
          await tester.precacheImagesInWidgetTree();
          await tester.precacheTopbarImages();
          await tester.loadFonts();

          // Pump the widget for a second to ensure animations are complete.
          await tester.pumpFrames(widget, const Duration(seconds: 1));

          // Set the locale and theme for the screenshot.
          final storeLocale = Locale(locale.languageCode, 'CA');

          // Set the screenshot file name.
          final screenshotName = switch (goldenDevice) {
            CustomGoldenScreenshotDevices.android10InchTablet => 'ANDROID_10_TABLET',
            CustomGoldenScreenshotDevices.android7InchTablet => 'ANDROID_7_TABLET',
            CustomGoldenScreenshotDevices.androidPhone => 'ANDROID_PHONE',
            CustomGoldenScreenshotDevices.iphone => 'IPHONE',
            CustomGoldenScreenshotDevices.ipad => 'IPAD_PRO_129',
          };

          final fileName = '${goldenFileName}_${screenshotName}_${theme.name}_${storeLocale.toLanguageTag()}';

          // Set the file path for the golden file.
          String filePath;
          if (goldenDevice.device.platform == TargetPlatform.android) {
            final folder = switch (goldenDevice) {
              CustomGoldenScreenshotDevices.android10InchTablet => 'tenInchScreenshots/',
              CustomGoldenScreenshotDevices.android7InchTablet => 'sevenInchScreenshots/',
              CustomGoldenScreenshotDevices.androidPhone => 'phoneScreenshots/',
              _ => throw UnimplementedError(),
            };

            filePath = p.join('../../android/fastlane/metadata/android/', storeLocale.toLanguageTag(), 'images', folder);
          } else if (goldenDevice.device.platform == TargetPlatform.iOS) {
            filePath = p.join('../../ios/fastlane/screenshots', storeLocale.toLanguageTag());
          } else {
            throw UnimplementedError();
          }

          // Take the screenshot and compare it to the golden file.
          await tester.expectScreenshot(device, fileName, goldenFilePath: filePath);

          debugDisableShadows = true;
        });
      }
    }
  });
}
