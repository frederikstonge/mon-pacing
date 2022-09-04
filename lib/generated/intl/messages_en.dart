// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(itemName) => "Are you sure you want to delete ${itemName}?";

  static String m1(modifiedDate) => "Modified on ${modifiedDate}";

  static String m2(minutes, seconds) => "${minutes} min ${seconds} sec";

  static String m3(type, category, theme, performers, durationMinutes,
          durationSeconds) =>
      "${type} | ${category} | ${theme} | ${performers} | ${durationMinutes} min ${durationSeconds} sec";

  static String m4(order) => "Improvisation #${order}";

  static String m5(count) => "Improvisations: ${count}";

  static String m6(min) => "Time: ${min} min";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "DeleteDialog_Content": m0,
        "DeleteDialog_Title": MessageLookupByLibrary.simpleMessage("Delete"),
        "Dialog_Cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "Dialog_Ok": MessageLookupByLibrary.simpleMessage("OK"),
        "ImprovisationType_compared":
            MessageLookupByLibrary.simpleMessage("Compared"),
        "ImprovisationType_mixed":
            MessageLookupByLibrary.simpleMessage("Mixed"),
        "ListTile_Modified": m1,
        "MatchesPage_Title": MessageLookupByLibrary.simpleMessage("Matches"),
        "PacingView_AddImprovisation":
            MessageLookupByLibrary.simpleMessage("Add Improvisation"),
        "PacingView_ImprovisationCategory":
            MessageLookupByLibrary.simpleMessage("Category"),
        "PacingView_ImprovisationDuration": m2,
        "PacingView_ImprovisationDurationHint":
            MessageLookupByLibrary.simpleMessage("Duration"),
        "PacingView_ImprovisationDurationMinutes":
            MessageLookupByLibrary.simpleMessage(" minutes"),
        "PacingView_ImprovisationDurationSeconds":
            MessageLookupByLibrary.simpleMessage(" seconds"),
        "PacingView_ImprovisationDurationTitle":
            MessageLookupByLibrary.simpleMessage("Select duration"),
        "PacingView_ImprovisationParticipants":
            MessageLookupByLibrary.simpleMessage("# of participant"),
        "PacingView_ImprovisationSubtitle": m3,
        "PacingView_ImprovisationTheme":
            MessageLookupByLibrary.simpleMessage("Theme"),
        "PacingView_ImprovisationTitle": m4,
        "PacingView_ImprovisationType":
            MessageLookupByLibrary.simpleMessage("Type"),
        "PacingView_Name": MessageLookupByLibrary.simpleMessage("Name"),
        "PacingView_NewPacing":
            MessageLookupByLibrary.simpleMessage("New Pacing"),
        "PacingView_Save": MessageLookupByLibrary.simpleMessage("Save"),
        "PacingView_TotalImprovisations": m5,
        "PacingView_TotalTime": m6,
        "PacingsPage_Title": MessageLookupByLibrary.simpleMessage("Pacings"),
        "SettingsPage_Title": MessageLookupByLibrary.simpleMessage("Settings"),
        "SettingsView_EnablePaddingDuration":
            MessageLookupByLibrary.simpleMessage("Enable padding duration"),
        "SettingsView_LanguageTitle":
            MessageLookupByLibrary.simpleMessage("Language"),
        "SettingsView_Language_English":
            MessageLookupByLibrary.simpleMessage("English"),
        "SettingsView_Language_French":
            MessageLookupByLibrary.simpleMessage("French"),
        "SettingsView_PaddingDuration":
            MessageLookupByLibrary.simpleMessage("Padding duration"),
        "SettingsView_Section_Application":
            MessageLookupByLibrary.simpleMessage("Application"),
        "SettingsView_Section_Pacings":
            MessageLookupByLibrary.simpleMessage("Pacings"),
        "SettingsView_ThemeTitle":
            MessageLookupByLibrary.simpleMessage("Select theme color"),
        "WillPopDialog_Content": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to go back? You will lose all unsaved changes."),
        "WillPopDialog_Title": MessageLookupByLibrary.simpleMessage("Changes")
      };
}
