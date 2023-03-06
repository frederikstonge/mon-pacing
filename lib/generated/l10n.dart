// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Are you sure you want to delete {itemName}?`
  String DeleteDialog_Content(Object itemName) {
    return Intl.message(
      'Are you sure you want to delete $itemName?',
      name: 'DeleteDialog_Content',
      desc: '',
      args: [itemName],
    );
  }

  /// `Delete`
  String get DeleteDialog_Title {
    return Intl.message(
      'Delete',
      name: 'DeleteDialog_Title',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Dialog_Cancel {
    return Intl.message(
      'Cancel',
      name: 'Dialog_Cancel',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get Dialog_Ok {
    return Intl.message(
      'OK',
      name: 'Dialog_Ok',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get Dialog_Save {
    return Intl.message(
      'Save',
      name: 'Dialog_Save',
      desc: '',
      args: [],
    );
  }

  /// `Compared`
  String get ImprovisationType_compared {
    return Intl.message(
      'Compared',
      name: 'ImprovisationType_compared',
      desc: '',
      args: [],
    );
  }

  /// `Mixed`
  String get ImprovisationType_mixed {
    return Intl.message(
      'Mixed',
      name: 'ImprovisationType_mixed',
      desc: '',
      args: [],
    );
  }

  /// `File exported {filePath}/{fileName}`
  String ListItem_ExportSuccess(Object filePath, Object fileName) {
    return Intl.message(
      'File exported $filePath/$fileName',
      name: 'ListItem_ExportSuccess',
      desc: '',
      args: [filePath, fileName],
    );
  }

  /// `Modified on {modifiedDate}`
  String ListItem_Modified(Object modifiedDate) {
    return Intl.message(
      'Modified on $modifiedDate',
      name: 'ListItem_Modified',
      desc: '',
      args: [modifiedDate],
    );
  }

  /// `Add team`
  String get MatchOptionsView_AddTeam {
    return Intl.message(
      'Add team',
      name: 'MatchOptionsView_AddTeam',
      desc: '',
      args: [],
    );
  }

  /// `Match`
  String get MatchOptionsView_Match {
    return Intl.message(
      'Match',
      name: 'MatchOptionsView_Match',
      desc: '',
      args: [],
    );
  }

  /// `Match Name`
  String get MatchOptionsView_Name {
    return Intl.message(
      'Match Name',
      name: 'MatchOptionsView_Name',
      desc: '',
      args: [],
    );
  }

  /// `Team`
  String get MatchOptionsView_Team {
    return Intl.message(
      'Team',
      name: 'MatchOptionsView_Team',
      desc: '',
      args: [],
    );
  }

  /// `Team Name`
  String get MatchOptionsView_TeamName {
    return Intl.message(
      'Team Name',
      name: 'MatchOptionsView_TeamName',
      desc: '',
      args: [],
    );
  }

  /// `Teams`
  String get MatchOptionsView_Teams {
    return Intl.message(
      'Teams',
      name: 'MatchOptionsView_Teams',
      desc: '',
      args: [],
    );
  }

  /// `{title} Options`
  String MatchOptionsView_Title(Object title) {
    return Intl.message(
      '$title Options',
      name: 'MatchOptionsView_Title',
      desc: '',
      args: [title],
    );
  }

  /// `Edit details`
  String get MatchView_EditDetails {
    return Intl.message(
      'Edit details',
      name: 'MatchView_EditDetails',
      desc: '',
      args: [],
    );
  }

  /// `View match summary`
  String get MatchView_ViewMatchSummary {
    return Intl.message(
      'View match summary',
      name: 'MatchView_ViewMatchSummary',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to go back? You might lose match data.`
  String get MatchView_WillPopDialog_Content {
    return Intl.message(
      'Are you sure you want to go back? You might lose match data.',
      name: 'MatchView_WillPopDialog_Content',
      desc: '',
      args: [],
    );
  }

  /// `Match in progress`
  String get MatchView_WillPopDialog_Title {
    return Intl.message(
      'Match in progress',
      name: 'MatchView_WillPopDialog_Title',
      desc: '',
      args: [],
    );
  }

  /// `Matches`
  String get MatchesPage_Title {
    return Intl.message(
      'Matches',
      name: 'MatchesPage_Title',
      desc: '',
      args: [],
    );
  }

  /// `Enable padding duration`
  String get PacingOptionsView_EnablePaddingDuration {
    return Intl.message(
      'Enable padding duration',
      name: 'PacingOptionsView_EnablePaddingDuration',
      desc: '',
      args: [],
    );
  }

  /// `Extra time to add for each improvisation in the total`
  String get PacingOptionsView_EnablePaddingDurationDescription {
    return Intl.message(
      'Extra time to add for each improvisation in the total',
      name: 'PacingOptionsView_EnablePaddingDurationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Nom du pacing`
  String get PacingOptionsView_Name {
    return Intl.message(
      'Nom du pacing',
      name: 'PacingOptionsView_Name',
      desc: '',
      args: [],
    );
  }

  /// `Pacing`
  String get PacingOptionsView_Pacing {
    return Intl.message(
      'Pacing',
      name: 'PacingOptionsView_Pacing',
      desc: '',
      args: [],
    );
  }

  /// `Padding duration`
  String get PacingOptionsView_PaddingDuration {
    return Intl.message(
      'Padding duration',
      name: 'PacingOptionsView_PaddingDuration',
      desc: '',
      args: [],
    );
  }

  /// `{title} Options`
  String PacingOptionsView_Title(Object title) {
    return Intl.message(
      '$title Options',
      name: 'PacingOptionsView_Title',
      desc: '',
      args: [title],
    );
  }

  /// `New pacing {date}`
  String PacingPage_NewPacingName(Object date) {
    return Intl.message(
      'New pacing $date',
      name: 'PacingPage_NewPacingName',
      desc: '',
      args: [date],
    );
  }

  /// `Add Improvisation`
  String get PacingView_AddImprovisation {
    return Intl.message(
      'Add Improvisation',
      name: 'PacingView_AddImprovisation',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get PacingView_ImprovisationCategory {
    return Intl.message(
      'Category',
      name: 'PacingView_ImprovisationCategory',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get PacingView_ImprovisationDurationHint {
    return Intl.message(
      'Duration',
      name: 'PacingView_ImprovisationDurationHint',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get PacingView_ImprovisationNotes {
    return Intl.message(
      'Notes',
      name: 'PacingView_ImprovisationNotes',
      desc: '',
      args: [],
    );
  }

  /// `# of participant`
  String get PacingView_ImprovisationParticipants {
    return Intl.message(
      '# of participant',
      name: 'PacingView_ImprovisationParticipants',
      desc: '',
      args: [],
    );
  }

  /// `{type} | {category} | {theme} | {performers} | {duration}`
  String PacingView_ImprovisationSubtitle(Object type, Object category,
      Object theme, Object performers, Object duration) {
    return Intl.message(
      '$type | $category | $theme | $performers | $duration',
      name: 'PacingView_ImprovisationSubtitle',
      desc: '',
      args: [type, category, theme, performers, duration],
    );
  }

  /// `Theme`
  String get PacingView_ImprovisationTheme {
    return Intl.message(
      'Theme',
      name: 'PacingView_ImprovisationTheme',
      desc: '',
      args: [],
    );
  }

  /// `Improvisation #{order}`
  String PacingView_ImprovisationTitle(Object order) {
    return Intl.message(
      'Improvisation #$order',
      name: 'PacingView_ImprovisationTitle',
      desc: '',
      args: [order],
    );
  }

  /// `Type`
  String get PacingView_ImprovisationType {
    return Intl.message(
      'Type',
      name: 'PacingView_ImprovisationType',
      desc: '',
      args: [],
    );
  }

  /// `Total time: {duration}`
  String PacingView_TotalDuration(Object duration) {
    return Intl.message(
      'Total time: $duration',
      name: 'PacingView_TotalDuration',
      desc: '',
      args: [duration],
    );
  }

  /// `Improvisations: {count}`
  String PacingView_TotalImprovisations(Object count) {
    return Intl.message(
      'Improvisations: $count',
      name: 'PacingView_TotalImprovisations',
      desc: '',
      args: [count],
    );
  }

  /// `Are you sure you want to go back? You will lose all unsaved changes.`
  String get PacingView_WillPopDialog_Content {
    return Intl.message(
      'Are you sure you want to go back? You will lose all unsaved changes.',
      name: 'PacingView_WillPopDialog_Content',
      desc: '',
      args: [],
    );
  }

  /// `Changes`
  String get PacingView_WillPopDialog_Title {
    return Intl.message(
      'Changes',
      name: 'PacingView_WillPopDialog_Title',
      desc: '',
      args: [],
    );
  }

  /// `Add pacing`
  String get PacingsPage_AddPacingTooltip {
    return Intl.message(
      'Add pacing',
      name: 'PacingsPage_AddPacingTooltip',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while importing the pacing`
  String get PacingsPage_ImportError {
    return Intl.message(
      'An error occurred while importing the pacing',
      name: 'PacingsPage_ImportError',
      desc: '',
      args: [],
    );
  }

  /// `Import`
  String get PacingsPage_ImportTooltip {
    return Intl.message(
      'Import',
      name: 'PacingsPage_ImportTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Pacings`
  String get PacingsPage_Title {
    return Intl.message(
      'Pacings',
      name: 'PacingsPage_Title',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get SettingsPage_Title {
    return Intl.message(
      'Settings',
      name: 'SettingsPage_Title',
      desc: '',
      args: [],
    );
  }

  /// `Default padding duration`
  String get SettingsView_DefaultPaddingDuration {
    return Intl.message(
      'Default padding duration',
      name: 'SettingsView_DefaultPaddingDuration',
      desc: '',
      args: [],
    );
  }

  /// `Enable default padding duration`
  String get SettingsView_EnableDefaultPaddingDuration {
    return Intl.message(
      'Enable default padding duration',
      name: 'SettingsView_EnableDefaultPaddingDuration',
      desc: '',
      args: [],
    );
  }

  /// `Extra time to add for each improvisation in the total`
  String get SettingsView_EnableDefaultPaddingDurationDescription {
    return Intl.message(
      'Extra time to add for each improvisation in the total',
      name: 'SettingsView_EnableDefaultPaddingDurationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get SettingsView_LanguageTitle {
    return Intl.message(
      'Language',
      name: 'SettingsView_LanguageTitle',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get SettingsView_Language_English {
    return Intl.message(
      'English',
      name: 'SettingsView_Language_English',
      desc: '',
      args: [],
    );
  }

  /// `French`
  String get SettingsView_Language_French {
    return Intl.message(
      'French',
      name: 'SettingsView_Language_French',
      desc: '',
      args: [],
    );
  }

  /// `Application`
  String get SettingsView_Section_Application {
    return Intl.message(
      'Application',
      name: 'SettingsView_Section_Application',
      desc: '',
      args: [],
    );
  }

  /// `Pacings`
  String get SettingsView_Section_Pacings {
    return Intl.message(
      'Pacings',
      name: 'SettingsView_Section_Pacings',
      desc: '',
      args: [],
    );
  }

  /// `Select theme color`
  String get SettingsView_ThemeTitle {
    return Intl.message(
      'Select theme color',
      name: 'SettingsView_ThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Field is required`
  String get ValidadatorHelper_FieldIsRequired {
    return Intl.message(
      'Field is required',
      name: 'ValidadatorHelper_FieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please resolve all validation errors.`
  String get ValidadatorHelper_ValidationMessageDialog_Content {
    return Intl.message(
      'Please resolve all validation errors.',
      name: 'ValidadatorHelper_ValidationMessageDialog_Content',
      desc: '',
      args: [],
    );
  }

  /// `Validation error`
  String get ValidadatorHelper_ValidationMessageDialog_Title {
    return Intl.message(
      'Validation error',
      name: 'ValidadatorHelper_ValidationMessageDialog_Title',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
