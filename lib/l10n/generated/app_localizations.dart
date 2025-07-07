import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en'), Locale('fr')];

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @addImprovisation.
  ///
  /// In en, this message translates to:
  /// **'Add improvisation'**
  String get addImprovisation;

  /// No description provided for @addPenalty.
  ///
  /// In en, this message translates to:
  /// **'Add penalty'**
  String get addPenalty;

  /// No description provided for @addTeam.
  ///
  /// In en, this message translates to:
  /// **'Add team'**
  String get addTeam;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Mon Pacing'**
  String get appTitle;

  /// No description provided for @areYouSureAction.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to {action}?'**
  String areYouSureAction({required String action});

  /// No description provided for @areYouSureActionName.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to {action} {name}?'**
  String areYouSureActionName({required String action, required String name});

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// No description provided for @compared.
  ///
  /// In en, this message translates to:
  /// **'Compared'**
  String get compared;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @createNewPacingTooltip.
  ///
  /// In en, this message translates to:
  /// **'Create a new pacing'**
  String get createNewPacingTooltip;

  /// No description provided for @createNewTeamTooltip.
  ///
  /// In en, this message translates to:
  /// **'Create a new team'**
  String get createNewTeamTooltip;

  /// No description provided for @createPacing.
  ///
  /// In en, this message translates to:
  /// **'Create pacing'**
  String get createPacing;

  /// No description provided for @createTeam.
  ///
  /// In en, this message translates to:
  /// **'Create team'**
  String get createTeam;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @defaultImprovisationSettingsTooltip.
  ///
  /// In en, this message translates to:
  /// **'These settings will be used as defaults when creating new improvisations, but can be changed individually.'**
  String get defaultImprovisationSettingsTooltip;

  /// No description provided for @defaultMatchSettingsTooltip.
  ///
  /// In en, this message translates to:
  /// **'These settings will be used as defaults when creating new matches, but can be changed individually.'**
  String get defaultMatchSettingsTooltip;

  /// No description provided for @defaultPacingSettingsTooltip.
  ///
  /// In en, this message translates to:
  /// **'These settings will be used as defaults when creating new pacings, but can be changed individually.'**
  String get defaultPacingSettingsTooltip;

  /// No description provided for @defaultPenaltySettingsTooltip.
  ///
  /// In en, this message translates to:
  /// **'These settings will be used as defaults when creating new penalties, but can be changed individually.'**
  String get defaultPenaltySettingsTooltip;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @duplicate.
  ///
  /// In en, this message translates to:
  /// **'Duplicate'**
  String get duplicate;

  /// No description provided for @duplicateTag.
  ///
  /// In en, this message translates to:
  /// **'Duplicate tag {tag}'**
  String duplicateTag({required String tag});

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @editDetails.
  ///
  /// In en, this message translates to:
  /// **'Edit details'**
  String get editDetails;

  /// No description provided for @editImprovisation.
  ///
  /// In en, this message translates to:
  /// **'Edit improvisation'**
  String get editImprovisation;

  /// No description provided for @editMatch.
  ///
  /// In en, this message translates to:
  /// **'Edit match'**
  String get editMatch;

  /// No description provided for @editPacing.
  ///
  /// In en, this message translates to:
  /// **'Edit pacing'**
  String get editPacing;

  /// No description provided for @editPenalty.
  ///
  /// In en, this message translates to:
  /// **'Edit penalty'**
  String get editPenalty;

  /// No description provided for @editTeam.
  ///
  /// In en, this message translates to:
  /// **'Edit team'**
  String get editTeam;

  /// No description provided for @enableHapticFeedback.
  ///
  /// In en, this message translates to:
  /// **'Enable haptic feedback'**
  String get enableHapticFeedback;

  /// No description provided for @enableMatchExpulsion.
  ///
  /// In en, this message translates to:
  /// **'Enable match expulsion'**
  String get enableMatchExpulsion;

  /// No description provided for @enableMatchExpulsionTooltip.
  ///
  /// In en, this message translates to:
  /// **'A performer with too many penalty points will be expelled from the match.'**
  String get enableMatchExpulsionTooltip;

  /// No description provided for @enablePenaltiesImpactPoints.
  ///
  /// In en, this message translates to:
  /// **'Enable penalties to impact points'**
  String get enablePenaltiesImpactPoints;

  /// No description provided for @enableStatistics.
  ///
  /// In en, this message translates to:
  /// **'Enable statistics'**
  String get enableStatistics;

  /// No description provided for @enableStatisticsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add team lineups and track points, penalties, etc.'**
  String get enableStatisticsTooltip;

  /// No description provided for @enableTimerHapticFeedback.
  ///
  /// In en, this message translates to:
  /// **'Enable timer haptic feedback'**
  String get enableTimerHapticFeedback;

  /// No description provided for @enableWakelock.
  ///
  /// In en, this message translates to:
  /// **'Enable wakelock'**
  String get enableWakelock;

  /// No description provided for @enableWakelockTooltip.
  ///
  /// In en, this message translates to:
  /// **'Prevent your screen from turning off when the timer is active.'**
  String get enableWakelockTooltip;

  /// No description provided for @exportMatchSheet.
  ///
  /// In en, this message translates to:
  /// **'Export match sheet'**
  String get exportMatchSheet;

  /// No description provided for @exportMatchSheetTo.
  ///
  /// In en, this message translates to:
  /// **'Export match sheet to {integrationId}'**
  String exportMatchSheetTo({required String integrationId});

  /// No description provided for @exportPacing.
  ///
  /// In en, this message translates to:
  /// **'Export pacing'**
  String get exportPacing;

  /// No description provided for @exportTeam.
  ///
  /// In en, this message translates to:
  /// **'Export team'**
  String get exportTeam;

  /// No description provided for @free.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get free;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @greaterThan.
  ///
  /// In en, this message translates to:
  /// **'Must be greater than {min}'**
  String greaterThan({required int min});

  /// No description provided for @huddle.
  ///
  /// In en, this message translates to:
  /// **'Huddle'**
  String get huddle;

  /// No description provided for @huddleTimer.
  ///
  /// In en, this message translates to:
  /// **'Huddle timer'**
  String get huddleTimer;

  /// No description provided for @huddleTimerTooltip.
  ///
  /// In en, this message translates to:
  /// **'Time allowed for the huddle before the improvisation starts. A timer will be added during the match.'**
  String get huddleTimerTooltip;

  /// No description provided for @importPacingTooltip.
  ///
  /// In en, this message translates to:
  /// **'Import pacing'**
  String get importPacingTooltip;

  /// No description provided for @importTeamTooltip.
  ///
  /// In en, this message translates to:
  /// **'Import team'**
  String get importTeamTooltip;

  /// No description provided for @improvisation.
  ///
  /// In en, this message translates to:
  /// **'Improvisation'**
  String get improvisation;

  /// No description provided for @improvisationCount.
  ///
  /// In en, this message translates to:
  /// **'Improvisation count: {count}'**
  String improvisationCount({required int count});

  /// No description provided for @improvisationDurationInSeconds.
  ///
  /// In en, this message translates to:
  /// **'Improvisation duration'**
  String get improvisationDurationInSeconds;

  /// No description provided for @improvisationIndex.
  ///
  /// In en, this message translates to:
  /// **'Improvisation position'**
  String get improvisationIndex;

  /// No description provided for @improvisationNumber.
  ///
  /// In en, this message translates to:
  /// **'Improvisation #{order}'**
  String improvisationNumber({required int order});

  /// No description provided for @improvisations.
  ///
  /// In en, this message translates to:
  /// **'Improvisations'**
  String get improvisations;

  /// No description provided for @integrationPacingMustHaveAtLeastXImprovisations.
  ///
  /// In en, this message translates to:
  /// **'Pacing must have at least {count, plural, one{{count} improvisation} other{{count} improvisations}}.'**
  String integrationPacingMustHaveAtLeastXImprovisations({required int count});

  /// No description provided for @integrationPacingMustHaveAtMostXImprovisations.
  ///
  /// In en, this message translates to:
  /// **'Pacing must have at most {count, plural, one{{count} improvisation} other{{count} improvisations}}.'**
  String integrationPacingMustHaveAtMostXImprovisations({required int count});

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @lesserThan.
  ///
  /// In en, this message translates to:
  /// **'Must be less than {max}'**
  String lesserThan({required int max});

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @ligma.
  ///
  /// In en, this message translates to:
  /// **'LIGMA'**
  String get ligma;

  /// No description provided for @ligmaEasterEgg.
  ///
  /// In en, this message translates to:
  /// **'BALLZ'**
  String get ligmaEasterEgg;

  /// No description provided for @lni.
  ///
  /// In en, this message translates to:
  /// **'LNI Vintage'**
  String get lni;

  /// No description provided for @major.
  ///
  /// In en, this message translates to:
  /// **'Major'**
  String get major;

  /// No description provided for @match.
  ///
  /// In en, this message translates to:
  /// **'Match'**
  String get match;

  /// No description provided for @matches.
  ///
  /// In en, this message translates to:
  /// **'Matches'**
  String get matches;

  /// No description provided for @matchSummary.
  ///
  /// In en, this message translates to:
  /// **'Match summary'**
  String get matchSummary;

  /// No description provided for @migrationCompleted.
  ///
  /// In en, this message translates to:
  /// **'Migration completed'**
  String get migrationCompleted;

  /// No description provided for @migrationError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred during migration. Please try again later.'**
  String get migrationError;

  /// No description provided for @migrationMatches.
  ///
  /// In en, this message translates to:
  /// **'Migrating matches...'**
  String get migrationMatches;

  /// No description provided for @migrationPacings.
  ///
  /// In en, this message translates to:
  /// **'Migrating pacings...'**
  String get migrationPacings;

  /// No description provided for @migrationStarted.
  ///
  /// In en, this message translates to:
  /// **'Starting database migration...'**
  String get migrationStarted;

  /// No description provided for @migrationTeams.
  ///
  /// In en, this message translates to:
  /// **'Migrating teams...'**
  String get migrationTeams;

  /// No description provided for @missingIgnoreBatteryOptimizationError.
  ///
  /// In en, this message translates to:
  /// **'Battery optimization is still enabled. Please go to your device\'s settings to ignore battery optimization.'**
  String get missingIgnoreBatteryOptimizationError;

  /// No description provided for @missingNotificationPermissionError.
  ///
  /// In en, this message translates to:
  /// **'Notification permission has been denied. Please go to your device\'s settings to allow notifications.'**
  String get missingNotificationPermissionError;

  /// No description provided for @mixed.
  ///
  /// In en, this message translates to:
  /// **'Mixed'**
  String get mixed;

  /// No description provided for @modifiedDate.
  ///
  /// In en, this message translates to:
  /// **'Modified date: {date}'**
  String modifiedDate({required DateTime date});

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @multipleOf.
  ///
  /// In en, this message translates to:
  /// **'Must be a multiple of {multiple}'**
  String multipleOf({required int multiple});

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @nextImprovisation.
  ///
  /// In en, this message translates to:
  /// **'Next improvisation'**
  String get nextImprovisation;

  /// No description provided for @noIntegrationFound.
  ///
  /// In en, this message translates to:
  /// **'No integration found.'**
  String get noIntegrationFound;

  /// No description provided for @noPenalty.
  ///
  /// In en, this message translates to:
  /// **'No penalty.'**
  String get noPenalty;

  /// No description provided for @noStar.
  ///
  /// In en, this message translates to:
  /// **'No star.'**
  String get noStar;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @notificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Timer'**
  String get notificationTitle;

  /// No description provided for @numberOfTeamsByDefault.
  ///
  /// In en, this message translates to:
  /// **'Default number of teams'**
  String get numberOfTeamsByDefault;

  /// No description provided for @onboardingByDefault.
  ///
  /// In en, this message translates to:
  /// **'These settings will be used as defaults, but can be changed individually.'**
  String get onboardingByDefault;

  /// No description provided for @onboardingLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Mon Pacing'**
  String get onboardingLanguageTitle;

  /// No description provided for @onboardingLanguageDescription.
  ///
  /// In en, this message translates to:
  /// **'Select your preferred language.'**
  String get onboardingLanguageDescription;

  /// No description provided for @onboardingPacingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Create your pacings'**
  String get onboardingPacingsTitle;

  /// No description provided for @onboardingPacingsDescription.
  ///
  /// In en, this message translates to:
  /// **'Create pacings for your matches with our tool.'**
  String get onboardingPacingsDescription;

  /// No description provided for @onboardingImprovisationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Customize your improvisations'**
  String get onboardingImprovisationsTitle;

  /// No description provided for @onboardingImprovisationsDescription.
  ///
  /// In en, this message translates to:
  /// **'Customize your improvisations with durations, types, tags, and more.'**
  String get onboardingImprovisationsDescription;

  /// No description provided for @onboardingMatchesTitle.
  ///
  /// In en, this message translates to:
  /// **'Enrich your matches'**
  String get onboardingMatchesTitle;

  /// No description provided for @onboardingMatchesDescription.
  ///
  /// In en, this message translates to:
  /// **'Add statistics and more to your matches.'**
  String get onboardingMatchesDescription;

  /// No description provided for @onboardingPenaltiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Track penalties'**
  String get onboardingPenaltiesTitle;

  /// No description provided for @onboardingPenaltiesDescription.
  ///
  /// In en, this message translates to:
  /// **'Add penalties to performers and expel them if necessary.'**
  String get onboardingPenaltiesDescription;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @onboardingPrevious.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get onboardingPrevious;

  /// No description provided for @onboardingDone.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get onboardingDone;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @pacing.
  ///
  /// In en, this message translates to:
  /// **'Pacing'**
  String get pacing;

  /// No description provided for @pacings.
  ///
  /// In en, this message translates to:
  /// **'Pacings'**
  String get pacings;

  /// No description provided for @pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// No description provided for @penalties.
  ///
  /// In en, this message translates to:
  /// **'Penalties'**
  String get penalties;

  /// No description provided for @penaltiesImpactPointsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Penalties impact the final score of the match.'**
  String get penaltiesImpactPointsTooltip;

  /// No description provided for @penaltiesImpactType.
  ///
  /// In en, this message translates to:
  /// **'Penalties impact type'**
  String get penaltiesImpactType;

  /// No description provided for @penaltiesImpactTypeAdd.
  ///
  /// In en, this message translates to:
  /// **'Penalties add points to other teams'**
  String get penaltiesImpactTypeAdd;

  /// No description provided for @penaltiesImpactTypeSubstract.
  ///
  /// In en, this message translates to:
  /// **'Penalties subtract points from their team'**
  String get penaltiesImpactTypeSubstract;

  /// No description provided for @penaltiesRequiredToExpel.
  ///
  /// In en, this message translates to:
  /// **'Penalties required to expel a performer'**
  String get penaltiesRequiredToExpel;

  /// No description provided for @penaltiesRequiredToImpactPoints.
  ///
  /// In en, this message translates to:
  /// **'Penalties required to impact points'**
  String get penaltiesRequiredToImpactPoints;

  /// No description provided for @penalty.
  ///
  /// In en, this message translates to:
  /// **'Penalty'**
  String get penalty;

  /// No description provided for @performer.
  ///
  /// In en, this message translates to:
  /// **'Performer'**
  String get performer;

  /// No description provided for @performerCount.
  ///
  /// In en, this message translates to:
  /// **'Performer count: {count}'**
  String performerCount({required int count});

  /// No description provided for @performers.
  ///
  /// In en, this message translates to:
  /// **'Performers'**
  String get performers;

  /// No description provided for @points.
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get points;

  /// No description provided for @previousImprovisation.
  ///
  /// In en, this message translates to:
  /// **'Previous improvisation'**
  String get previousImprovisation;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Field is required'**
  String get required;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @resetSettingsToDefault.
  ///
  /// In en, this message translates to:
  /// **'Reset settings to default'**
  String get resetSettingsToDefault;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @scanner.
  ///
  /// In en, this message translates to:
  /// **'Scanner for integrations'**
  String get scanner;

  /// No description provided for @scoreboard.
  ///
  /// In en, this message translates to:
  /// **'Scoreboard'**
  String get scoreboard;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search {category}...'**
  String search({required String category});

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @stars.
  ///
  /// In en, this message translates to:
  /// **'Stars'**
  String get stars;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @startMatch.
  ///
  /// In en, this message translates to:
  /// **'Start match'**
  String get startMatch;

  /// No description provided for @stop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stop;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// No description provided for @tags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get tags;

  /// No description provided for @tagsHint.
  ///
  /// In en, this message translates to:
  /// **'Separated by comma (,)'**
  String get tagsHint;

  /// No description provided for @team.
  ///
  /// In en, this message translates to:
  /// **'Team'**
  String get team;

  /// No description provided for @teams.
  ///
  /// In en, this message translates to:
  /// **'Teams'**
  String get teams;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @timeBuffer.
  ///
  /// In en, this message translates to:
  /// **'Timer buffer'**
  String get timeBuffer;

  /// No description provided for @timeBufferTooltip.
  ///
  /// In en, this message translates to:
  /// **'Extra time that will be added on top of each improvisation\'s duration to compensate for voting and more. This is only used to evaluate the total time of a pacing.'**
  String get timeBufferTooltip;

  /// No description provided for @timerHapticFeedbackTooltip.
  ///
  /// In en, this message translates to:
  /// **'Timer will vibrate every minute, 30 seconds, 10 seconds, 5, 4, 3, 2, 1.'**
  String get timerHapticFeedbackTooltip;

  /// No description provided for @timerIsActiveError.
  ///
  /// In en, this message translates to:
  /// **'Unable to {action} improvisation. Timer is active.'**
  String timerIsActiveError({required String action});

  /// No description provided for @toasterGenericError.
  ///
  /// In en, this message translates to:
  /// **'An error has occurred.'**
  String get toasterGenericError;

  /// No description provided for @toasterMatchDeleted.
  ///
  /// In en, this message translates to:
  /// **'Match deleted.'**
  String get toasterMatchDeleted;

  /// No description provided for @toasterMatchResultExported.
  ///
  /// In en, this message translates to:
  /// **'Match result exported.'**
  String get toasterMatchResultExported;

  /// No description provided for @toasterPacingDeleted.
  ///
  /// In en, this message translates to:
  /// **'Pacing deleted.'**
  String get toasterPacingDeleted;

  /// No description provided for @toasterPacingExported.
  ///
  /// In en, this message translates to:
  /// **'Pacing exported.'**
  String get toasterPacingExported;

  /// No description provided for @toasterPacingImported.
  ///
  /// In en, this message translates to:
  /// **'Pacing imported.'**
  String get toasterPacingImported;

  /// No description provided for @toasterTeamDeleted.
  ///
  /// In en, this message translates to:
  /// **'Team deleted.'**
  String get toasterTeamDeleted;

  /// No description provided for @toasterTeamExported.
  ///
  /// In en, this message translates to:
  /// **'Team exported.'**
  String get toasterTeamExported;

  /// No description provided for @toasterTeamImported.
  ///
  /// In en, this message translates to:
  /// **'Team imported.'**
  String get toasterTeamImported;

  /// No description provided for @toasterYouCantStartAMatchWithAnEmptyTeam.
  ///
  /// In en, this message translates to:
  /// **'You can\'t start a match with an empty team.'**
  String get toasterYouCantStartAMatchWithAnEmptyTeam;

  /// No description provided for @toasterYouCantStartAMatchWithoutImprovisation.
  ///
  /// In en, this message translates to:
  /// **'You can\'t start a match without improvisation.'**
  String get toasterYouCantStartAMatchWithoutImprovisation;

  /// No description provided for @toasterYouMustFillAllPerformersName.
  ///
  /// In en, this message translates to:
  /// **'You must fill in all performers\' names.'**
  String get toasterYouMustFillAllPerformersName;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @tutorialAddPacing.
  ///
  /// In en, this message translates to:
  /// **'To start, create your first pacing by tapping the button below.'**
  String get tutorialAddPacing;

  /// No description provided for @tutorialStartMatch.
  ///
  /// In en, this message translates to:
  /// **'Swipe right or press the play button to start a match.'**
  String get tutorialStartMatch;

  /// No description provided for @tutorialAddImprovisation.
  ///
  /// In en, this message translates to:
  /// **'Add improvisations to your pacing by tapping the button below.'**
  String get tutorialAddImprovisation;

  /// No description provided for @tutorialFirstImprovisationCard.
  ///
  /// In en, this message translates to:
  /// **'Tap on the improvisation card to expand it and add details.'**
  String get tutorialFirstImprovisationCard;

  /// No description provided for @tutorialFirstImprovisationDrag.
  ///
  /// In en, this message translates to:
  /// **'Tap and hold this icon to reorder improvisations.'**
  String get tutorialFirstImprovisationDrag;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @unlimited.
  ///
  /// In en, this message translates to:
  /// **'Unlimited'**
  String get unlimited;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version: {version}'**
  String version({required String version});

  /// No description provided for @versus.
  ///
  /// In en, this message translates to:
  /// **'vs'**
  String get versus;

  /// No description provided for @warningExpelPlayerDescription.
  ///
  /// In en, this message translates to:
  /// **'Performer {performer} has {penalty} penalty points.'**
  String warningExpelPlayerDescription({required int penalty, required String performer});

  /// No description provided for @warningExpelPlayerTitle.
  ///
  /// In en, this message translates to:
  /// **'Player to expel'**
  String get warningExpelPlayerTitle;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return SEn();
    case 'fr':
      return SFr();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
