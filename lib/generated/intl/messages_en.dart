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
        "WillPopDialog_Content": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to go back? You will lose all unsaved changes."),
        "WillPopDialog_Title": MessageLookupByLibrary.simpleMessage("Changes")
      };
}
