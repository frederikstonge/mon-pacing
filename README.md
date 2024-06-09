# Mon Pacing

[![Codemagic build status](https://api.codemagic.io/apps/66182d00f959c53097b7c5cf/66182d00f959c53097b7c5ce/status_badge.svg)](https://codemagic.io/apps/66182d00f959c53097b7c5cf/66182d00f959c53097b7c5ce/latest_build)

A project used by referees for Robert Gravel's Improvisation style matches.
[Ligue Nationale d'Improvisation](https://en.wikipedia.org/wiki/Ligue_nationale_d%27improvisation)

<img src="https://github.com/frederikstonge/mon-pacing/assets/5427239/f5214a96-dfdb-4eb8-9a5b-6e7cffbe083d" height="20%" width="20%" />
<img src="https://github.com/frederikstonge/mon-pacing/assets/5427239/f906abd6-a684-4feb-b2ba-a89af030948d" height="20%" width="20%" />
<img src="https://github.com/frederikstonge/mon-pacing/assets/5427239/3e087e69-aae0-4a92-acf9-e59d85feb3d0" height="20%" width="20%" />
<img src="https://github.com/frederikstonge/mon-pacing/assets/5427239/da6031ec-4a56-447f-a76d-76e64621aeb3" height="20%" width="20%" />
<img src="https://github.com/frederikstonge/mon-pacing/assets/5427239/d529b8be-0757-4222-aebb-4555317296fe" height="20%" width="20%" />

## Development

Use Visual Studio Code, and install recommended extensions.


### Models
- freezed (models)
```bash
dart pub run build_runner build --delete-conflicting-outputs
```

- l10n (translations)
```bash
flutter gen-l10n
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
