import 'package:kaisel/kaisel.dart';
import 'package:material_ui/material_ui.dart';

import '../components/bottom_sheet/bottom_sheet_page.dart';
import '../components/color_picker/color_picker.dart';
import '../components/duration_picker/duration_picker.dart';
import '../components/match_menu/match_menu.dart';
import '../components/message_box_dialog/message_box_page.dart';
import '../components/message_box_dialog/message_box_view.dart';
import '../components/pacing_menu/pacing_menu.dart';
import '../components/penalties_impact_type/penalties_impact_type_view.dart';
import '../components/share_menu/share_menu.dart';
import '../components/team_menu/team_menu.dart';
import '../models/improvisation_model.dart';
import '../models/match_model.dart';
import '../models/pacing_model.dart';
import '../models/penalties_impact_type.dart';
import '../models/penalty_model.dart';
import '../models/team_model.dart';
import '../models/theme_type.dart';
import '../pages/categories_search/categories_search_page_shell.dart';
import '../pages/match_detail/match_detail_page_shell.dart';
import '../pages/match_improvisation/match_improvisation_shell.dart';
import '../pages/match_penalty/match_penalty_shell.dart';
import '../pages/match_scoreboard/match_scoreboard_shell.dart';
import '../pages/onboarding/onboarding_page_view.dart';
import '../pages/pacing_detail/pacing_detail_page_shell.dart';
import '../pages/penalties_search/penalties_search_page_shell.dart';
import '../pages/scanner/scanner_page_shell.dart';
import '../pages/settings/widgets/language_view.dart';
import '../pages/settings/widgets/theme_view.dart';
import '../pages/shell/shell_page_shell.dart';
import '../pages/tags_search/tags_search_page_shell.dart';
import '../pages/team_detail/team_detail_page_shell.dart';
import '../router/router.dart';
import '../router/routes.dart';

class RouterService {
  RouterService({required bool Function() onboardingFinished, required List<NavigatorObserver> Function() observers}) {
    pacingsRouter = KaiselRouter<PacingsRoute>(initial: const PacingsTabRoute());
    matchesRouter = KaiselRouter<MatchesRoute>(initial: const MatchesTabRoute());
    teamsRouter = KaiselRouter<TeamsRoute>(initial: const TeamsTabRoute());
    settingsRouter = KaiselRouter<SettingsRoute>(initial: const SettingsTabRoute());
    appShell = BranchedShellRouter(branches: [pacingsRouter, matchesRouter, teamsRouter, settingsRouter]);
    final initialRoute = onboardingFinished() ? const TabsRoute() : const OnboardingRoute();
    routerConfig = KaiselRouterConfig<AppRoute>(
      initial: initialRoute,
      guards: [
        (current, proposed) {
          if (!onboardingFinished() && proposed.any((route) => route is! OnboardingRoute)) {
            return const [OnboardingRoute()];
          }
          return proposed;
        },
      ],
      builder: _buildRoute,
      pageWrapper: _buildPage,
      modalBuilder: (_, _, flowChild) => flowChild,
      observers: observers,
      codec: const MatchNotificationCodec(),
      fallback: [initialRoute],
    );
  }

  late final KaiselRouter<PacingsRoute> pacingsRouter;
  late final KaiselRouter<MatchesRoute> matchesRouter;
  late final KaiselRouter<TeamsRoute> teamsRouter;
  late final KaiselRouter<SettingsRoute> settingsRouter;
  late final BranchedShellRouter appShell;
  late final KaiselRouterConfig<AppRoute> routerConfig;

  KaiselRouter<AppRoute> get rootRouter => routerConfig.router;

  void dispose() {
    routerConfig.dispose();
    appShell.dispose();
    pacingsRouter.dispose();
    matchesRouter.dispose();
    teamsRouter.dispose();
    settingsRouter.dispose();
  }

  Future<void> showPacingDetails(int id) async {
    await rootRouter.set(const [TabsRoute()]);
    appShell.switchTo(0);
    await pacingsRouter.set([const PacingsTabRoute(), PacingRoute(id)]);
  }

  Future<void> showMatchDetails({required int id, int? improvisationId, int? durationIndex}) async {
    await rootRouter.set(const [TabsRoute()]);
    appShell.switchTo(1);
    await matchesRouter.set([
      const MatchesTabRoute(),
      MatchRoute(id: id, improvisationId: improvisationId, durationIndex: durationIndex),
    ]);
  }

  Future<void> replaceMatchDetails({required int id, int? improvisationId, int? durationIndex}) {
    return matchesRouter.replaceTop(MatchRoute(id: id, improvisationId: improvisationId, durationIndex: durationIndex));
  }

  Future<PacingModel?> showPacingDetailModal({PacingModel? pacing, required bool editMode}) =>
      rootRouter.run(PacingDetailModalRoute(pacing: pacing, editMode: editMode));

  Future<MatchModel?> showMatchDetailModal({MatchModel? match, PacingModel? pacing}) =>
      rootRouter.run(MatchDetailModalRoute(match: match, pacing: pacing));

  Future<TeamModel?> showTeamDetailModal({TeamModel? team, required bool editMode}) =>
      rootRouter.run(TeamDetailModalRoute(team: team, editMode: editMode));

  Future<Duration?> showDurationPickerModal({required String title, required Duration initialDuration}) =>
      rootRouter.run(DurationPickerModalRoute(title: title, initialDuration: initialDuration));

  Future<Color?> showColorPickerModal({required String title, required Color initialColor}) =>
      rootRouter.run(ColorPickerModalRoute(title: title, initialColor: initialColor));

  Future<Locale?> showLanguageModal({required Locale currentLocale, required List<Locale> availableLocales}) =>
      rootRouter.run(LanguageModalRoute(currentLocale: currentLocale, availableLocales: availableLocales));

  Future<ThemeType?> showThemeModal(ThemeType currentTheme) => rootRouter.run(ThemeModalRoute(currentTheme));

  Future<PenaltiesImpactType?> showPenaltiesImpactTypeModal(PenaltiesImpactType currentType) =>
      rootRouter.run(PenaltiesImpactTypeModalRoute(currentType));

  Future<PenaltyModel?> showMatchPenaltyModal({
    required int improvisationId,
    required List<TeamModel> teams,
    required List<String>? integrationPenaltyTypes,
    PenaltyModel? penalty,
  }) => rootRouter.run(
    MatchPenaltyModalRoute(
      improvisationId: improvisationId,
      teams: teams,
      integrationPenaltyTypes: integrationPenaltyTypes,
      penalty: penalty,
    ),
  );

  Future<(ImprovisationModel, int)?> showMatchImprovisationModal({
    required MatchModel match,
    ImprovisationModel? improvisation,
  }) => rootRouter.run(MatchImprovisationModalRoute(match: match, improvisation: improvisation));

  Future<PacingMenuAction?> showPacingMenuModal({
    required PacingModel pacing,
    bool showEdit = false,
    bool showEditDetails = false,
  }) => rootRouter.run(PacingMenuModalRoute(pacing: pacing, showEdit: showEdit, showEditDetails: showEditDetails));

  Future<MatchMenuAction?> showMatchMenuModal({
    required MatchModel match,
    bool showEdit = false,
    bool showEditDetails = false,
  }) => rootRouter.run(MatchMenuModalRoute(match: match, showEdit: showEdit, showEditDetails: showEditDetails));

  Future<TeamMenuAction?> showTeamMenuModal(TeamModel team) => rootRouter.run(TeamMenuModalRoute(team));

  Future<ShareMenuAction?> showShareMenuModal({
    bool showShareText = false,
    bool showShareFile = false,
    bool showSaveFile = false,
  }) => rootRouter.run(
    ShareMenuModalRoute(showShareText: showShareText, showShareFile: showShareFile, showSaveFile: showSaveFile),
  );

  Future<void> showMatchScoreboardModal(MatchModel match) => rootRouter.run(MatchScoreboardModalRoute(match));

  Future<bool?> showQuestion({required String question, required String yesLabel, required String noLabel}) =>
      rootRouter.run(QuestionModalRoute(question: question, yesLabel: yesLabel, noLabel: noLabel));

  Future<void> showAlert({required String message, required String closeLabel}) =>
      rootRouter.run(AlertModalRoute(message: message, closeLabel: closeLabel));

  Future<void> resetBranch(int branch) async {
    switch (branch) {
      case 0:
        await pacingsRouter.set(const [PacingsTabRoute()]);
      case 1:
        await matchesRouter.set(const [MatchesTabRoute()]);
      case 2:
        await teamsRouter.set(const [TeamsTabRoute()]);
      case 3:
        await settingsRouter.set(const [SettingsTabRoute()]);
    }
  }

  Widget _buildRoute(BuildContext context, AppRoute route) => switch (route) {
    OnboardingRoute() => const OnboardingPageView(),
    TabsRoute() => const ShellPageShell(),
    ScannerRoute() => const ScannerPageShell(),
    CategoriesSearchRoute() => const CategoriesSearchPageShell(),
    PenaltiesSearchRoute() => const PenaltiesSearchPageShell(),
    TagsSearchRoute() => const TagsSearchPageShell(),
    PacingDetailModalRoute(:final pacing, :final editMode) => PacingDetailPageShell(
      pacing: pacing,
      editMode: editMode,
      onConfirm: (pacing, flowContext) => flowContext.completeFlow<PacingModel>(pacing),
    ),
    MatchDetailModalRoute(:final match, :final pacing) => MatchDetailPageShell(
      match: match,
      pacing: pacing,
      onConfirm: (match, flowContext) => flowContext.completeFlow<MatchModel>(match),
    ),
    TeamDetailModalRoute(:final team, :final editMode) => TeamDetailPageShell(
      team: team,
      editMode: editMode,
      onConfirm: (team, flowContext) => flowContext.completeFlow<TeamModel>(team),
    ),
    DurationPickerModalRoute(:final title, :final initialDuration) => DurationPicker(
      title: title,
      initialDuration: initialDuration,
      onChanged: (duration) => context.completeFlow<Duration>(duration),
    ),
    ColorPickerModalRoute(:final title, :final initialColor) => AColorPicker(
      title: title,
      initialColor: initialColor,
      onChanged: (color) => context.completeFlow<Color>(color),
    ),
    LanguageModalRoute(:final currentLocale, :final availableLocales) => LanguageView(
      currentLocale: currentLocale,
      availableLocales: availableLocales,
      onChanged: (locale) => context.completeFlow<Locale>(locale),
    ),
    ThemeModalRoute(:final currentTheme) => ThemeView(
      currentTheme: currentTheme,
      onChanged: (theme) => context.completeFlow<ThemeType>(theme),
    ),
    PenaltiesImpactTypeModalRoute(:final currentType) => PenaltiesImpactTypeView(
      currentPenaltiesImpactType: currentType,
      onChanged: (type) => context.completeFlow<PenaltiesImpactType>(type),
    ),
    MatchPenaltyModalRoute(:final improvisationId, :final teams, :final integrationPenaltyTypes, :final penalty) =>
      MatchPenaltyShell(
        improvisationId: improvisationId,
        teams: teams,
        integrationPenaltyTypes: integrationPenaltyTypes,
        penalty: penalty,
        onSave: (penalty) => context.completeFlow<PenaltyModel>(penalty),
      ),
    MatchImprovisationModalRoute(:final match, :final improvisation) => MatchImprovisationShell(
      match: match,
      improvisation: improvisation,
      onConfirm: (improvisation, index, flowContext) =>
          flowContext.completeFlow<(ImprovisationModel, int)>((improvisation, index)),
    ),
    PacingMenuModalRoute(:final pacing, :final showEdit, :final showEditDetails) => PacingMenu(
      pacing: pacing,
      showEdit: showEdit,
      showEditDetails: showEditDetails,
      onSelected: (action) => context.completeFlow<PacingMenuAction>(action),
    ),
    MatchMenuModalRoute(:final match, :final showEdit, :final showEditDetails) => MatchMenu(
      match: match,
      showEdit: showEdit,
      showEditDetails: showEditDetails,
      onSelected: (action) => context.completeFlow<MatchMenuAction>(action),
    ),
    TeamMenuModalRoute(:final team) => TeamMenu(
      team: team,
      onSelected: (action) => context.completeFlow<TeamMenuAction>(action),
    ),
    ShareMenuModalRoute(:final showShareText, :final showShareFile, :final showSaveFile) => ShareMenu(
      showShareText: showShareText,
      showShareFile: showShareFile,
      showSaveFile: showSaveFile,
      onSelected: (action) => context.completeFlow<ShareMenuAction>(action),
    ),
    MatchScoreboardModalRoute(:final match) => MatchScoreboardShell(match: match),
    QuestionModalRoute(:final question, :final yesLabel, :final noLabel) => QuestionView(
      question: question,
      yesLabel: yesLabel,
      noLabel: noLabel,
    ),
    AlertModalRoute(:final message, :final closeLabel) => AlertView(message: message, closeLabel: closeLabel),
  };

  Page<Object?> _buildPage(KaiselPageWrapperContext<AppRoute> context) {
    if (context.isFlow) {
      return switch (context.route) {
        QuestionModalRoute() || AlertModalRoute() => MessageBoxPage(
          key: context.key,
          name: context.route.routeName,
          arguments: context.route,
          child: context.child,
        ),
        PacingDetailModalRoute() ||
        MatchDetailModalRoute() ||
        TeamDetailModalRoute() ||
        MatchPenaltyModalRoute() ||
        MatchImprovisationModalRoute() ||
        MatchScoreboardModalRoute() => BottomSheetPage(
          key: context.key,
          name: context.route.routeName,
          arguments: context.route,
          isScrollControlled: true,
          child: context.child,
        ),
        _ => BottomSheetPage(
          key: context.key,
          name: context.route.routeName,
          arguments: context.route,
          child: context.child,
        ),
      };
    }

    return MaterialPage<Object?>(
      key: context.key,
      name: context.route.routeName,
      arguments: context.route,
      child: context.child,
    );
  }
}
