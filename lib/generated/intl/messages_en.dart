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

  static String m1(filePath, fileName) =>
      "File exported ${filePath}/${fileName}";

  static String m2(modifiedDate) => "Modified on ${modifiedDate}";

  static String m3(title) => "${title} Options";

  static String m4(title) => "${title} Options";

  static String m5(date) => "New pacing ${date}";

  static String m6(type, category, theme, performers, duration) =>
      "${type} | ${category} | ${theme} | ${performers} | ${duration}";

  static String m7(order) => "Improvisation #${order}";

  static String m8(duration) => "Total time: ${duration}";

  static String m9(count) => "Improvisations: ${count}";

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
        "ListItem_ExportSuccess": m1,
        "ListItem_Modified": m2,
        "MatchOptionsView_Match": MessageLookupByLibrary.simpleMessage("Match"),
        "MatchOptionsView_Name":
            MessageLookupByLibrary.simpleMessage("Match Name"),
        "MatchOptionsView_Team": MessageLookupByLibrary.simpleMessage("Team"),
        "MatchOptionsView_TeamName":
            MessageLookupByLibrary.simpleMessage("Team Name"),
        "MatchOptionsView_Teams": MessageLookupByLibrary.simpleMessage("Teams"),
        "MatchOptionsView_Title": m3,
        "MatchView_EditDetails":
            MessageLookupByLibrary.simpleMessage("Edit details"),
        "MatchView_ViewMatchSummary":
            MessageLookupByLibrary.simpleMessage("View match summary"),
        "MatchView_WillPopDialog_Content": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to go back? You might lose match data."),
        "MatchView_WillPopDialog_Title":
            MessageLookupByLibrary.simpleMessage("Match in progress"),
        "MatchesPage_Title": MessageLookupByLibrary.simpleMessage("Matches"),
        "PacingOptionsView_Name":
            MessageLookupByLibrary.simpleMessage("Nom du pacing"),
        "PacingOptionsView_Pacing":
            MessageLookupByLibrary.simpleMessage("Pacing"),
        "PacingOptionsView_Title": m4,
        "PacingPage_NewPacingName": m5,
        "PacingView_AddImprovisation":
            MessageLookupByLibrary.simpleMessage("Add Improvisation"),
        "PacingView_ImprovisationCategory":
            MessageLookupByLibrary.simpleMessage("Category"),
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
        "PacingView_ImprovisationSubtitle": m6,
        "PacingView_ImprovisationTheme":
            MessageLookupByLibrary.simpleMessage("Theme"),
        "PacingView_ImprovisationTitle": m7,
        "PacingView_ImprovisationType":
            MessageLookupByLibrary.simpleMessage("Type"),
        "PacingView_Save": MessageLookupByLibrary.simpleMessage("Save"),
        "PacingView_TotalDuration": m8,
        "PacingView_TotalImprovisations": m9,
        "PacingView_WillPopDialog_Content": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to go back? You will lose all unsaved changes."),
        "PacingView_WillPopDialog_Title":
            MessageLookupByLibrary.simpleMessage("Changes"),
        "PacingsPage_AddPacingTooltip":
            MessageLookupByLibrary.simpleMessage("Add pacing"),
        "PacingsPage_ImportError": MessageLookupByLibrary.simpleMessage(
            "An error occurred while importing the pacing"),
        "PacingsPage_ImportTooltip":
            MessageLookupByLibrary.simpleMessage("Import"),
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
        "Settings_View_EnablePaddingDurationDescription":
            MessageLookupByLibrary.simpleMessage(
                "Extra time to add for each improvisation in the total"),
        "ValidadatorHelper_FieldIsRequired":
            MessageLookupByLibrary.simpleMessage("Field is required"),
        "ValidadatorHelper_ValidationMessageDialog_Content":
            MessageLookupByLibrary.simpleMessage(
                "Please resolve all validation errors."),
        "ValidadatorHelper_ValidationMessageDialog_Title":
            MessageLookupByLibrary.simpleMessage("Validation error")
      };
}
