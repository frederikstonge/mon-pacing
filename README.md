# Mon Pacing

A project used by referees for Gravel's Improv style matches.
[Ligue Nationale d'Improvisation](https://en.wikipedia.org/wiki/Ligue_nationale_d%27improvisation)


## Technologies

- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [freezed](https://pub.dev/packages/freezed)
- [sqflite](https://pub.dev/packages/sqflite)
- [intl](https://pub.dev/packages/intl)
- [syncfusion_flutter_xlsio](https://pub.dev/packages/syncfusion_flutter_xlsio)


## Development

Use Visual Studio Code, and install recommended extensions.


### Models

To regenerate models with freezed, under `Explorer`, `Build Runner`, click the play icon.


### Resources

To update resources, right click on the `I10n` folder, then click on `i18n arb editor`. Once you click on saved, open one of the .arb file and save it manually.


## Roadmap

- Handle points
- Handle penalties
- Match summaries
- Export match summaries in excel
- Handle overtime


## Update flutter/app
- Get the latest Flutter/dart SDKs

```bash
flutter upgrade
```

- Update packages in pubspec.yaml

```bash
flutter pub upgrade --major-versions
```

<!-- - Migrate project to latest flutter template

```bash
# If you get "filename too long" error, run this with admin rights
# git config --system core.longpaths true

dart run flutter_migrate:flutter_migrate start
``` -->