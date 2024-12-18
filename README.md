![image](https://github.com/user-attachments/assets/ada94008-2fd4-48a2-aece-40b922fa8e11)

# Mon Pacing

![Build & Deploy](https://github.com/frederikstonge/mon-pacing/actions/workflows/build-deploy.yml/badge.svg)

A project used by referees for Robert Gravel's Improvisation style matches.

- [Mon Pacing](https://linktr.ee/monpacing)
- [Ligue Nationale d'Improvisation](https://en.wikipedia.org/wiki/Ligue_nationale_d%27improvisation)

## Development

Use Visual Studio Code, and install recommended extensions.


### Models
- dart_mappable (models)
```bash
dart pub run build_runner build --delete-conflicting-outputs
```

- l10n (translations)
```bash
flutter gen-l10n
```

### Splash Screen
To generate splash screens, update images/flutter_native_splash.yaml and run :
```bash
dart run flutter_native_splash:create
```

### App Icon
To generate splash screens, update images/icons_launcher.yaml and run :
```bash
dart run icons_launcher:create
```

### Update flutter/app
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
