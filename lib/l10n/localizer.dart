import 'generated/app_localizations.dart';
import 'locale_helper.dart';

class Localizer {
  static S current = lookupS(LocaleHelper.getCurrentLocale());
}
