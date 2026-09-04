import 'package:material_ui/material_ui.dart';
import 'package:world_flags/world_flags.dart';

class DisplayLanguage extends StatelessWidget {
  final Locale locale;
  final double flagHeight;
  final double flagWidth;
  final TextStyle? textStyle;

  const DisplayLanguage({super.key, required this.locale, this.flagHeight = 14, this.flagWidth = 20, this.textStyle});

  @override
  Widget build(BuildContext context) {
    final language = NaturalLanguage.fromCodeShort(locale.languageCode);
    final script = locale.scriptCode != null ? Script.fromCode(locale.scriptCode!) : null;
    final basicLocale = BasicLocale(language, countryCode: locale.countryCode, script: script);
    return Row(
      children: [
        LanguageFlag.fromFlagMap(language, height: flagHeight, width: flagWidth),
        const SizedBox(width: 4),
        Text(language.commonNameFor(basicLocale), maxLines: 1, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
