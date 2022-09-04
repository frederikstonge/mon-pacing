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

  /// `Modified on {modifiedDate}`
  String ListTile_Modified(Object modifiedDate) {
    return Intl.message(
      'Modified on $modifiedDate',
      name: 'ListTile_Modified',
      desc: '',
      args: [modifiedDate],
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

  /// `{minutes} min {seconds} sec`
  String PacingView_ImprovisationDuration(Object minutes, Object seconds) {
    return Intl.message(
      '$minutes min $seconds sec',
      name: 'PacingView_ImprovisationDuration',
      desc: '',
      args: [minutes, seconds],
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

  /// ` minutes`
  String get PacingView_ImprovisationDurationMinutes {
    return Intl.message(
      ' minutes',
      name: 'PacingView_ImprovisationDurationMinutes',
      desc: '',
      args: [],
    );
  }

  /// ` seconds`
  String get PacingView_ImprovisationDurationSeconds {
    return Intl.message(
      ' seconds',
      name: 'PacingView_ImprovisationDurationSeconds',
      desc: '',
      args: [],
    );
  }

  /// `Select duration`
  String get PacingView_ImprovisationDurationTitle {
    return Intl.message(
      'Select duration',
      name: 'PacingView_ImprovisationDurationTitle',
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

  /// `{type} | {category} | {theme} | {performers} | {durationMinutes} min {durationSeconds} sec`
  String PacingView_ImprovisationSubtitle(
      Object type,
      Object category,
      Object theme,
      Object performers,
      Object durationMinutes,
      Object durationSeconds) {
    return Intl.message(
      '$type | $category | $theme | $performers | $durationMinutes min $durationSeconds sec',
      name: 'PacingView_ImprovisationSubtitle',
      desc: '',
      args: [
        type,
        category,
        theme,
        performers,
        durationMinutes,
        durationSeconds
      ],
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

  /// `Name`
  String get PacingView_Name {
    return Intl.message(
      'Name',
      name: 'PacingView_Name',
      desc: '',
      args: [],
    );
  }

  /// `New Pacing`
  String get PacingView_NewPacing {
    return Intl.message(
      'New Pacing',
      name: 'PacingView_NewPacing',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get PacingView_Save {
    return Intl.message(
      'Save',
      name: 'PacingView_Save',
      desc: '',
      args: [],
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

  /// `Time: {min} min`
  String PacingView_TotalTime(Object min) {
    return Intl.message(
      'Time: $min min',
      name: 'PacingView_TotalTime',
      desc: '',
      args: [min],
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

  /// `Enable padding duration`
  String get SettingsView_EnablePaddingDuration {
    return Intl.message(
      'Enable padding duration',
      name: 'SettingsView_EnablePaddingDuration',
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

  /// `Padding duration`
  String get SettingsView_PaddingDuration {
    return Intl.message(
      'Padding duration',
      name: 'SettingsView_PaddingDuration',
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

  /// `Are you sure you want to go back? You will lose all unsaved changes.`
  String get WillPopDialog_Content {
    return Intl.message(
      'Are you sure you want to go back? You will lose all unsaved changes.',
      name: 'WillPopDialog_Content',
      desc: '',
      args: [],
    );
  }

  /// `Changes`
  String get WillPopDialog_Title {
    return Intl.message(
      'Changes',
      name: 'WillPopDialog_Title',
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
