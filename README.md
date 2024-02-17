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

- Install globally ``flutter_migrate` :
```bash
flutter pub global activate flutter_migrate
```

- Run the tool :

```bash
# If you get "filename too long" error, run this with admin rights
# git config --system core.longpaths true

flutter pub global run flutter_migrate start
```