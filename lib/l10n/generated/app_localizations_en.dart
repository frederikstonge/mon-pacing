// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get add => 'Add';

  @override
  String get addImprovisation => 'Add improvisation';

  @override
  String get addPenalty => 'Add penalty';

  @override
  String get addTeam => 'Add team';

  @override
  String get appTitle => 'Mon Pacing';

  @override
  String areYouSureAction({required String action}) {
    return 'Are you sure you want to $action?';
  }

  @override
  String areYouSureActionName({required String action, required String name}) {
    return 'Are you sure you want to $action $name?';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get category => 'Category';

  @override
  String get categories => 'Categories';

  @override
  String get close => 'Close';

  @override
  String get color => 'Color';

  @override
  String get compared => 'Compared';

  @override
  String get confirm => 'Confirm';

  @override
  String get create => 'Create';

  @override
  String get createNewPacingTooltip => 'Create a new pacing';

  @override
  String get createNewTeamTooltip => 'Create a new team';

  @override
  String get createPacing => 'Create pacing';

  @override
  String get createTeam => 'Create team';

  @override
  String get dark => 'Dark';

  @override
  String get defaultImprovisationSettingsTooltip =>
      'These settings will be used as defaults when creating new improvisations, but can be changed individually.';

  @override
  String get defaultMatchSettingsTooltip =>
      'These settings will be used as defaults when creating new matches, but can be changed individually.';

  @override
  String get defaultPacingSettingsTooltip =>
      'These settings will be used as defaults when creating new pacings, but can be changed individually.';

  @override
  String get defaultPenaltySettingsTooltip =>
      'These settings will be used as defaults when creating new penalties, but can be changed individually.';

  @override
  String get delete => 'Delete';

  @override
  String get duplicate => 'Duplicate';

  @override
  String duplicateTag({required String tag}) {
    return 'Duplicate tag $tag';
  }

  @override
  String get duration => 'Duration';

  @override
  String get edit => 'Edit';

  @override
  String get editDetails => 'Edit details';

  @override
  String get editImprovisation => 'Edit improvisation';

  @override
  String get editMatch => 'Edit match';

  @override
  String get editPacing => 'Edit pacing';

  @override
  String get editPenalty => 'Edit penalty';

  @override
  String get editTeam => 'Edit team';

  @override
  String get enableHapticFeedback => 'Enable haptic feedback';

  @override
  String get enableMatchExpulsion => 'Enable match expulsion';

  @override
  String get enableMatchExpulsionTooltip => 'A performer with too many penalty points will be expelled from the match.';

  @override
  String get enablePenaltiesImpactPoints => 'Enable penalties to impact points';

  @override
  String get enableStatistics => 'Enable statistics';

  @override
  String get enableStatisticsTooltip => 'Add team lineups and track points, penalties, etc.';

  @override
  String get enableTimerHapticFeedback => 'Enable timer haptic feedback';

  @override
  String get enableWakelock => 'Enable wakelock';

  @override
  String get enableWakelockTooltip => 'Prevent your screen from turning off when the timer is active.';

  @override
  String get exportMatchSheet => 'Export match sheet';

  @override
  String exportMatchSheetTo({required String integrationId}) {
    return 'Export match sheet to $integrationId';
  }

  @override
  String get exportPacing => 'Export pacing';

  @override
  String get exportTeam => 'Export team';

  @override
  String get free => 'Free';

  @override
  String get general => 'General';

  @override
  String greaterThan({required int min}) {
    return 'Must be greater than $min';
  }

  @override
  String get huddle => 'Huddle';

  @override
  String get huddleTimer => 'Huddle timer';

  @override
  String get huddleTimerTooltip =>
      'Time allowed for the huddle before the improvisation starts. A timer will be added during the match.';

  @override
  String get importPacingTooltip => 'Import pacing';

  @override
  String get importTeamTooltip => 'Import team';

  @override
  String get improvisation => 'Improvisation';

  @override
  String improvisationCount({required int count}) {
    return 'Improvisation count: $count';
  }

  @override
  String get improvisationDurationInSeconds => 'Improvisation duration';

  @override
  String get improvisationIndex => 'Improvisation position';

  @override
  String improvisationNumber({required int order}) {
    return 'Improvisation #$order';
  }

  @override
  String get improvisations => 'Improvisations';

  @override
  String integrationPacingMustHaveAtLeastXImprovisations({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count improvisations',
      one: '$count improvisation',
    );
    return 'Pacing must have at least $_temp0.';
  }

  @override
  String integrationPacingMustHaveAtMostXImprovisations({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count improvisations',
      one: '$count improvisation',
    );
    return 'Pacing must have at most $_temp0.';
  }

  @override
  String get language => 'Language';

  @override
  String lesserThan({required int max}) {
    return 'Must be less than $max';
  }

  @override
  String get light => 'Light';

  @override
  String get ligma => 'LIGMA';

  @override
  String get ligmaEasterEgg => 'BALLZ';

  @override
  String get lni => 'LNI Vintage';

  @override
  String get major => 'Major';

  @override
  String get match => 'Match';

  @override
  String get matches => 'Matches';

  @override
  String get matchSummary => 'Match summary';

  @override
  String get migrationCompleted => 'Migration completed';

  @override
  String get migrationError => 'An error occurred during migration. Please try again later.';

  @override
  String get migrationMatches => 'Migrating matches...';

  @override
  String get migrationPacings => 'Migrating pacings...';

  @override
  String get migrationStarted => 'Starting database migration...';

  @override
  String get migrationTeams => 'Migrating teams...';

  @override
  String minimumLength({required int length}) {
    return 'Must be at least $length characters long';
  }

  @override
  String get missingIgnoreBatteryOptimizationError =>
      'Battery optimization is still enabled. Please go to your device\'s settings to ignore battery optimization.';

  @override
  String get missingNotificationPermissionError =>
      'Notification permission has been denied. Please go to your device\'s settings to allow notifications.';

  @override
  String get mixed => 'Mixed';

  @override
  String modifiedDate({required DateTime date}) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Modified date: $dateString';
  }

  @override
  String get more => 'More';

  @override
  String multipleOf({required int multiple}) {
    return 'Must be a multiple of $multiple';
  }

  @override
  String get name => 'Name';

  @override
  String get noIntegrationFound => 'No integration found.';

  @override
  String get noPenalty => 'No penalty.';

  @override
  String get noStar => 'No star.';

  @override
  String get notes => 'Notes';

  @override
  String get notificationTitle => 'Timer';

  @override
  String get numberOfTeamsByDefault => 'Default number of teams';

  @override
  String get onboardingByDefault => 'These settings will be used as defaults, but can be changed individually.';

  @override
  String get onboardingLanguageTitle => 'Welcome to Mon Pacing';

  @override
  String get onboardingLanguageDescription => 'Select your preferred language.';

  @override
  String get onboardingPacingsTitle => 'Create your pacings';

  @override
  String get onboardingPacingsDescription => 'Create pacings for your matches with our tool.';

  @override
  String get onboardingImprovisationsTitle => 'Customize your improvisations';

  @override
  String get onboardingImprovisationsDescription =>
      'Customize your improvisations with durations, types, tags, and more.';

  @override
  String get onboardingMatchesTitle => 'Enrich your matches';

  @override
  String get onboardingMatchesDescription => 'Add statistics and more to your matches.';

  @override
  String get onboardingPenaltiesTitle => 'Track penalties';

  @override
  String get onboardingPenaltiesDescription => 'Add penalties to performers and expel them if necessary.';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingPrevious => 'Back';

  @override
  String get onboardingDone => 'Get started';

  @override
  String get open => 'Open';

  @override
  String get pacing => 'Pacing';

  @override
  String get pacings => 'Pacings';

  @override
  String get pause => 'Pause';

  @override
  String get penalties => 'Penalties';

  @override
  String get penaltiesImpactPointsTooltip => 'Penalties impact the final score of the match.';

  @override
  String get penaltiesImpactType => 'Penalties impact type';

  @override
  String get penaltiesImpactTypeAdd => 'Penalties add points to other teams';

  @override
  String get penaltiesImpactTypeSubstract => 'Penalties subtract points from their team';

  @override
  String get penaltiesRequiredToExpel => 'Penalties required to expel a performer';

  @override
  String get penaltiesRequiredToImpactPoints => 'Penalties required to impact points';

  @override
  String get penalty => 'Penalty';

  @override
  String get performer => 'Performer';

  @override
  String performerCount({required int count}) {
    return 'Performer count: $count';
  }

  @override
  String get performers => 'Performers';

  @override
  String get points => 'Points';

  @override
  String get required => 'Field is required';

  @override
  String get remove => 'Remove';

  @override
  String get resetSettingsToDefault => 'Reset settings to default';

  @override
  String get save => 'Save';

  @override
  String get scanner => 'Scanner for integrations';

  @override
  String get scoreboard => 'Scoreboard';

  @override
  String search({required String category}) {
    return 'Search $category...';
  }

  @override
  String get settings => 'Settings';

  @override
  String get stars => 'Stars';

  @override
  String get start => 'Start';

  @override
  String get startMatch => 'Start match';

  @override
  String get stop => 'Stop';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get tags => 'Tags';

  @override
  String get tagsHint => 'Separated by comma (,)';

  @override
  String get team => 'Team';

  @override
  String get teams => 'Teams';

  @override
  String get theme => 'Theme';

  @override
  String get timeBuffer => 'Timer buffer';

  @override
  String get timeBufferTooltip =>
      'Extra time that will be added on top of each improvisation\'s duration to compensate for voting and more. This is only used to evaluate the total time of a pacing.';

  @override
  String get timerHapticFeedbackTooltip => 'Timer will vibrate every minute, 30 seconds, 10 seconds, 5, 4, 3, 2, 1.';

  @override
  String timerIsActiveError({required String action}) {
    return 'Unable to $action improvisation. Timer is active.';
  }

  @override
  String get toasterGenericError => 'An error has occurred.';

  @override
  String get toasterMatchDeleted => 'Match deleted.';

  @override
  String get toasterMatchResultExported => 'Match result exported.';

  @override
  String get toasterPacingDeleted => 'Pacing deleted.';

  @override
  String get toasterPacingExported => 'Pacing exported.';

  @override
  String get toasterPacingImported => 'Pacing imported.';

  @override
  String get toasterTeamDeleted => 'Team deleted.';

  @override
  String get toasterTeamExported => 'Team exported.';

  @override
  String get toasterTeamImported => 'Team imported.';

  @override
  String get toasterYouCantStartAMatchWithAnEmptyTeam => 'You can\'t start a match with an empty team.';

  @override
  String get toasterYouCantStartAMatchWithoutImprovisation => 'You can\'t start a match without improvisation.';

  @override
  String get toasterYouMustFillAllPerformersName => 'You must fill in all performers\' names.';

  @override
  String get total => 'Total';

  @override
  String get tutorialAddPacing => 'To start, create your first pacing by tapping the button below.';

  @override
  String get tutorialStartMatch => 'Swipe right or press the play button to start a match.';

  @override
  String get tutorialAddImprovisation => 'Add improvisations to your pacing by tapping the button below.';

  @override
  String get tutorialFirstImprovisationCard => 'Tap on the improvisation card to expand it and add details.';

  @override
  String get tutorialFirstImprovisationDrag => 'Tap and hold this icon to reorder improvisations.';

  @override
  String get type => 'Type';

  @override
  String get unlimited => 'Unlimited';

  @override
  String version({required String version}) {
    return 'Version: $version';
  }

  @override
  String get versus => 'vs';

  @override
  String warningExpelPlayerDescription({required int penalty, required String performer}) {
    return 'Performer $performer has $penalty penalty points.';
  }

  @override
  String get warningExpelPlayerTitle => 'Player to expel';
}
