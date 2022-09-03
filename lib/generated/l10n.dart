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
