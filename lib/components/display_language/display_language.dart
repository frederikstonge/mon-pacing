import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

class DisplayLanguage extends StatelessWidget {
  final Locale locale;
  final double flagSize;
  final TextStyle? textStyle;

  const DisplayLanguage({
    super.key,
    required this.locale,
    this.flagSize = 20,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) => Localizations.override(
        context: context,
        locale: locale,
        delegates: const [
          LocaleNamesLocalizationsDelegate(),
        ],
        child: Builder(
            builder: (context) => Row(
                  children: [
                    FlagCode.fromLanguageCode(locale.languageCode.toLowerCase()) != null
                        ? CountryFlag.fromLanguageCode(
                            locale.languageCode,
                            height: flagSize,
                            width: flagSize,
                          )
                        : CountryFlag.fromCountryCode(
                            locale.languageCode,
                            height: flagSize,
                            width: flagSize,
                          ),
                    const SizedBox(width: 4),
                    Text(
                      LocaleNames.of(context)!.nameOf(locale.languageCode) ?? locale.toString(),
                    ),
                  ],
                )),
      );
}
