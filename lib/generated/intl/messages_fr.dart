// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(itemName) =>
      "Êtes-vous sûr de vouloir supprimer ${itemName}?";

  static String m1(filePath, fileName) =>
      "Fichier exporté ${filePath}/${fileName}";

  static String m2(modifiedDate) => "Modifié le ${modifiedDate}";

  static String m3(title) => "Options de ${title}";

  static String m4(title) => "Options de ${title}";

  static String m5(date) => "Nouveau pacing ${date}";

  static String m6(type, category, theme, performers, duration) =>
      "${type} | ${category} | ${theme} | ${performers} | ${duration}";

  static String m7(order) => "Improvisation #${order}";

  static String m8(duration) => "Temps total: ${duration}";

  static String m9(count) => "Improvisations: ${count}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "DeleteDialog_Content": m0,
        "DeleteDialog_Title": MessageLookupByLibrary.simpleMessage("Supprimer"),
        "Dialog_Cancel": MessageLookupByLibrary.simpleMessage("Annuler"),
        "Dialog_Ok": MessageLookupByLibrary.simpleMessage("OK"),
        "ImprovisationType_compared":
            MessageLookupByLibrary.simpleMessage("Comparée"),
        "ImprovisationType_mixed":
            MessageLookupByLibrary.simpleMessage("Mixte"),
        "ListItem_ExportSuccess": m1,
        "ListItem_Modified": m2,
        "MatchOptionsView_Name":
            MessageLookupByLibrary.simpleMessage("Nom du match"),
        "MatchOptionsView_Team": MessageLookupByLibrary.simpleMessage("Équipe"),
        "MatchOptionsView_Teams":
            MessageLookupByLibrary.simpleMessage("Équipes"),
        "MatchOptionsView_Title": m3,
        "MatchView_EditDetails":
            MessageLookupByLibrary.simpleMessage("Modifier les détails"),
        "MatchView_ViewMatchSummary":
            MessageLookupByLibrary.simpleMessage("Voir le sommaire du match"),
        "MatchView_WillPopDialog_Content": MessageLookupByLibrary.simpleMessage(
            "Êtes-vous sûr de vouloir revenir en arrière? Vous pourriez perdre des informations du match."),
        "MatchView_WillPopDialog_Title":
            MessageLookupByLibrary.simpleMessage("Match en cours"),
        "MatchesPage_Title": MessageLookupByLibrary.simpleMessage("Matchs"),
        "PacingOptionsView_Name":
            MessageLookupByLibrary.simpleMessage("Pacing Name"),
        "PacingOptionsView_Title": m4,
        "PacingPage_NewPacingName": m5,
        "PacingView_AddImprovisation":
            MessageLookupByLibrary.simpleMessage("Ajouter une improvisation"),
        "PacingView_ImprovisationCategory":
            MessageLookupByLibrary.simpleMessage("Catégorie"),
        "PacingView_ImprovisationDurationHint":
            MessageLookupByLibrary.simpleMessage("Durée"),
        "PacingView_ImprovisationDurationMinutes":
            MessageLookupByLibrary.simpleMessage(" minutes"),
        "PacingView_ImprovisationDurationSeconds":
            MessageLookupByLibrary.simpleMessage(" seconds"),
        "PacingView_ImprovisationDurationTitle":
            MessageLookupByLibrary.simpleMessage("Sélectionner la durée"),
        "PacingView_ImprovisationParticipants":
            MessageLookupByLibrary.simpleMessage("Nombre de joueur"),
        "PacingView_ImprovisationSubtitle": m6,
        "PacingView_ImprovisationTheme":
            MessageLookupByLibrary.simpleMessage("Thème"),
        "PacingView_ImprovisationTitle": m7,
        "PacingView_ImprovisationType":
            MessageLookupByLibrary.simpleMessage("Type"),
        "PacingView_Save": MessageLookupByLibrary.simpleMessage("Sauvegarder"),
        "PacingView_TotalDuration": m8,
        "PacingView_TotalImprovisations": m9,
        "PacingView_WillPopDialog_Content": MessageLookupByLibrary.simpleMessage(
            "Êtes-vous sûr de vouloir revenir en arrière? Vous allez perdre tous les changements non sauvegardés."),
        "PacingView_WillPopDialog_Title":
            MessageLookupByLibrary.simpleMessage("Changements"),
        "PacingsPage_AddPacingTooltip":
            MessageLookupByLibrary.simpleMessage("Ajouter un pacing"),
        "PacingsPage_ImportError": MessageLookupByLibrary.simpleMessage(
            "Une erreur est survenue en important le pacing"),
        "PacingsPage_ImportTooltip":
            MessageLookupByLibrary.simpleMessage("Importer"),
        "PacingsPage_Title": MessageLookupByLibrary.simpleMessage("Pacings"),
        "SettingsPage_Title":
            MessageLookupByLibrary.simpleMessage("Paramètres"),
        "SettingsView_EnablePaddingDuration":
            MessageLookupByLibrary.simpleMessage("Activer la durée tampon"),
        "SettingsView_LanguageTitle":
            MessageLookupByLibrary.simpleMessage("Langue"),
        "SettingsView_Language_English":
            MessageLookupByLibrary.simpleMessage("Anglais"),
        "SettingsView_Language_French":
            MessageLookupByLibrary.simpleMessage("Français"),
        "SettingsView_PaddingDuration":
            MessageLookupByLibrary.simpleMessage("Durée tampon"),
        "SettingsView_Section_Application":
            MessageLookupByLibrary.simpleMessage("Application"),
        "SettingsView_Section_Pacings":
            MessageLookupByLibrary.simpleMessage("Pacings"),
        "SettingsView_ThemeTitle":
            MessageLookupByLibrary.simpleMessage("Choisir la couleur du thème"),
        "Settings_View_EnablePaddingDurationDescription":
            MessageLookupByLibrary.simpleMessage(
                "Temps d\'extra à ajouter pour chaque improvisation dans le total"),
        "ValidadatorHelper_FieldIsRequired":
            MessageLookupByLibrary.simpleMessage("Le champ est obligatoire"),
        "ValidadatorHelper_ValidationMessageDialog_Content":
            MessageLookupByLibrary.simpleMessage(
                "Veuillez régler toutes les erreurs de validation."),
        "ValidadatorHelper_ValidationMessageDialog_Title":
            MessageLookupByLibrary.simpleMessage("Erreur de validation")
      };
}
