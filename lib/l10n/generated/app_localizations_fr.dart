// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class SFr extends S {
  SFr([String locale = 'fr']) : super(locale);

  @override
  String get add => 'Ajouter';

  @override
  String get addImprovisation => 'Ajouter une improvisation';

  @override
  String get addPenalty => 'Ajouter une pénalité';

  @override
  String get addTeam => 'Ajouter une équipe';

  @override
  String get appTitle => 'Mon Pacing';

  @override
  String areYouSureAction({required String action}) {
    return 'Êtes-vous sûr de vouloir $action?';
  }

  @override
  String areYouSureActionName({required String action, required String name}) {
    return 'Êtes-vous sûr de vouloir $action $name?';
  }

  @override
  String get cancel => 'Annuler';

  @override
  String get category => 'Catégorie';

  @override
  String get categories => 'Catégories';

  @override
  String get color => 'Couleur';

  @override
  String get compared => 'Comparée';

  @override
  String get confirm => 'Confirmer';

  @override
  String get create => 'Créer';

  @override
  String get createNewPacingTooltip => 'Créer un nouveau pacing';

  @override
  String get createNewTeamTooltip => 'Créer une nouvelle équipe';

  @override
  String get createPacing => 'Créer un pacing';

  @override
  String get createTeam => 'Créer une équipe';

  @override
  String get dark => 'Sombre';

  @override
  String get defaultImprovisationSettingsTooltip =>
      'Ces paramètres seront utilisés par défaut lors de la création de nouvelles improvisations, mais pourront être changés individuellement.';

  @override
  String get defaultMatchSettingsTooltip =>
      'Ces paramètres seront utilisés par défaut lors de la création de nouveaux matchs, mais pourront être changés individuellement.';

  @override
  String get defaultPacingSettingsTooltip =>
      'Ces paramètres seront utilisés par défaut lors de la création de nouveaux pacings, mais pourront être changés individuellement.';

  @override
  String get defaultPenaltySettingsTooltip =>
      'Ces paramètres seront utilisés par défaut lors de la création de nouvelles pénalités, mais pourront être changés individuellement.';

  @override
  String get delete => 'Supprimer';

  @override
  String get duplicate => 'Dupliquer';

  @override
  String duplicateTag({required String tag}) {
    return 'Étiquette $tag dupliquée ';
  }

  @override
  String get duration => 'Durée';

  @override
  String get edit => 'Modifier';

  @override
  String get editDetails => 'Modifier les détails';

  @override
  String get editImprovisation => 'Modifier l\'improvisation';

  @override
  String get editMatch => 'Modifier le match';

  @override
  String get editPacing => 'Modifier le pacing';

  @override
  String get editPenalty => 'Modifier une pénalité';

  @override
  String get editTeam => 'Modifier l\'équipe';

  @override
  String get enableHapticFeedback => 'Activer la vibration';

  @override
  String get enableMatchExpulsion => 'Activé les expulsions de match';

  @override
  String get enableMatchExpulsionTooltip => 'Un interprète avec trop de points de pénalité sera expulsé du match.';

  @override
  String get enablePenaltiesImpactPoints => 'Activer l\'impact des pénalités sur le pointage';

  @override
  String get enableStatistics => 'Activer les statistiques';

  @override
  String get enableStatisticsTooltip => 'Ajouter les alignements des équipes et calculer les points, pénalités etc';

  @override
  String get enableTimerHapticFeedback => 'Activer la vibration du chronomètre';

  @override
  String get enableWakelock => 'Activer le vérouillage de réveil';

  @override
  String get enableWakelockTooltip => 'Empêche l\'écran de fermer lorsque le chronomètre est actif.';

  @override
  String get exportMatchSheet => 'Exporter la feuille de match';

  @override
  String exportMatchSheetTo({required String integrationId}) {
    return 'Exporter la feuille de match à $integrationId';
  }

  @override
  String get exportPacing => 'Exporter le pacing';

  @override
  String get exportTeam => 'Exporter une équipe';

  @override
  String get free => 'Libre';

  @override
  String get general => 'Général';

  @override
  String greaterThan({required int min}) {
    return 'Doit être plus grand que $min';
  }

  @override
  String get huddle => 'Caucus';

  @override
  String get huddleTimer => 'Chronomètre de caucus';

  @override
  String get huddleTimerTooltip =>
      'Temps alloué pour le caucus avant que l\'improvisation commence. Un chronomètre sera ajouté durant le match.';

  @override
  String get importPacingTooltip => 'Importer un pacing';

  @override
  String get importTeamTooltip => 'Importer une équipe';

  @override
  String get improvisation => 'Improvisation';

  @override
  String improvisationCount({required int count}) {
    return 'Nombre d\'improvisations: $count';
  }

  @override
  String get improvisationDurationInSeconds => 'Durée d\'improvisation';

  @override
  String get improvisationIndex => 'Position de l\'improvisation';

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
    return 'Le pacing doit avoir au moins $_temp0.';
  }

  @override
  String integrationPacingMustHaveAtMostXImprovisations({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count improvisations',
      one: '$count improvisation',
    );
    return 'Le pacing doit avoir au plus $_temp0.';
  }

  @override
  String get language => 'Langue';

  @override
  String lesserThan({required int max}) {
    return 'Doit être plus petit que $max';
  }

  @override
  String get light => 'Clair';

  @override
  String get lni => 'LNI Vintage';

  @override
  String get major => 'Majeur';

  @override
  String get match => 'Match';

  @override
  String get matches => 'Matchs';

  @override
  String get matchSummary => 'Sommaire du match';

  @override
  String get migrationCompleted => 'Migration complétée';

  @override
  String get migrationMatches => 'Migration des matchs...';

  @override
  String get migrationPacings => 'Migration des pacings...';

  @override
  String get migrationStarted => 'Migration de la base de données...';

  @override
  String get migrationTeams => 'Migration des équipes...';

  @override
  String get missingIgnoreBatteryOptimizationError =>
      'L\'optimisation de la batterie est toujours activé. Veuillez aller dans les paramêtres de votre appareil pour ignorer l\'optimisation de la batterie.';

  @override
  String get missingNotificationPermissionError =>
      'La permission de recevoir des notifications a été déclinée. Veuillez aller dans les paramêtres de votre appareil pour autoriser les notifications.';

  @override
  String get mixed => 'Mixte';

  @override
  String modifiedDate({required DateTime date}) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Date de modification: $dateString';
  }

  @override
  String get more => 'Plus';

  @override
  String multipleOf({required int multiple}) {
    return 'Doit être un multiple de $multiple';
  }

  @override
  String get name => 'Nom';

  @override
  String get nextImprovisation => 'Improvisation suivante';

  @override
  String get noIntegrationFound => 'Aucune intégration trouvée.';

  @override
  String get noPenalty => 'Aucune pénalité.';

  @override
  String get noStar => 'Aucune étoile.';

  @override
  String get notes => 'Notes';

  @override
  String get notificationTitle => 'Chronomètre';

  @override
  String get numberOfTeamsByDefault => 'Nombre d\'équipes par défaut';

  @override
  String get open => 'Ouvrir';

  @override
  String get pacing => 'Pacing';

  @override
  String get pacings => 'Pacings';

  @override
  String get pause => 'Pauser';

  @override
  String get penalties => 'Pénalités';

  @override
  String get penaltiesImpactPointsTooltip => 'Les pénalités impacteront le résultat final du match.';

  @override
  String get penaltiesImpactType => 'Type d\'impact des pénalités';

  @override
  String get penaltiesImpactTypeAdd => 'Les pénalités ajoutent des points aux autres équipes';

  @override
  String get penaltiesImpactTypeSubstract => 'Les pénalités enlèvent des points a son équipe';

  @override
  String get penaltiesRequiredToExpel => 'Pénalités requises pour expulser un interprète';

  @override
  String get penaltiesRequiredToImpactPoints => 'Pénalités requises pour impacter le pointage';

  @override
  String get penalty => 'Pénalité';

  @override
  String get performer => 'Interprète';

  @override
  String performerCount({required int count}) {
    return 'Nombre d\'interprètes: $count';
  }

  @override
  String get performers => 'Interprètes';

  @override
  String get points => 'Points';

  @override
  String get previousImprovisation => 'Improvisation précédente';

  @override
  String get required => 'Le champ est requis';

  @override
  String get remove => 'Enlever';

  @override
  String get resetSettingsToDefault => 'Réinitialiser les paramètres';

  @override
  String get save => 'Sauvegarder';

  @override
  String get scanner => 'Scan pour les intégrations';

  @override
  String get scoreboard => 'Panneau de résultats';

  @override
  String search({required String category}) {
    return 'Rechercher $category...';
  }

  @override
  String get settings => 'Paramètres';

  @override
  String get stars => 'Étoiles';

  @override
  String get start => 'Démarrer';

  @override
  String get startMatch => 'Commencer un match';

  @override
  String get stop => 'Arrêter';

  @override
  String get subtotal => 'Sous-total';

  @override
  String get tags => 'Étiquettes';

  @override
  String get tagsHint => 'séparé par une virgule (,)';

  @override
  String get team => 'Équipe';

  @override
  String get teams => 'Équipes';

  @override
  String get theme => 'Thème';

  @override
  String get timeBuffer => 'Temps tampon';

  @override
  String get timeBufferTooltip =>
      'Temps supplémentaire qui sera ajouté à la durée de chaque improvisation pour compenser pour le vote etc. Cette valeur ne sera utilisée que pour évaluer la durée totale d\'un pacing.';

  @override
  String get timerHapticFeedbackTooltip =>
      'Le chronomètre vibrera à chaque minute, 30 secondes, 10 secondes, 5, 4, 3, 2, 1.';

  @override
  String timerIsActiveError({required String action}) {
    return 'Impossible de $action l\'improvisation. Le chronomètre est activé.';
  }

  @override
  String get toasterGenericError => 'Une erreur est survenue.';

  @override
  String get toasterMatchDeleted => 'Match supprimé.';

  @override
  String get toasterMatchResultExported => 'Le résultat de match a été exporté.';

  @override
  String get toasterPacingDeleted => 'Pacing supprimé.';

  @override
  String get toasterPacingExported => 'Pacing exporté.';

  @override
  String get toasterPacingImported => 'Pacing importé.';

  @override
  String get toasterTeamDeleted => 'Équipe supprimée.';

  @override
  String get toasterTeamExported => 'Équipe exportée.';

  @override
  String get toasterTeamImported => 'Équipe importée.';

  @override
  String get toasterYouCantStartAMatchWithAnEmptyTeam => 'Vous ne pouvez pas démarrer un match avec une équipe vide.';

  @override
  String get toasterYouCantStartAMatchWithoutImprovisation =>
      'Vous ne pouvez pas démarrer un match sans improvisation.';

  @override
  String get toasterYouMustFillAllPerformersName => 'Vous devez remplir tous les noms d\'interprète.';

  @override
  String get total => 'Total';

  @override
  String get type => 'Type';

  @override
  String get unlimited => 'Illimité';

  @override
  String version({required String version}) {
    return 'Version: $version';
  }

  @override
  String get versus => 'vs';

  @override
  String warningExpelPlayerDescription({required int penalty, required String performer}) {
    return 'L\'interprète $performer a $penalty points de pénalité.';
  }

  @override
  String get warningExpelPlayerTitle => 'Joueur à expulser';
}
