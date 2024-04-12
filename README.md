# Mon Pacing

[![Codemagic build status](https://api.codemagic.io/apps/66182d00f959c53097b7c5cf/66182d00f959c53097b7c5ce/status_badge.svg)](https://codemagic.io/apps/66182d00f959c53097b7c5cf/66182d00f959c53097b7c5ce/latest_build)

A project used by referees for Robert Gravel's Improvisation style matches.
[Ligue Nationale d'Improvisation](https://en.wikipedia.org/wiki/Ligue_nationale_d%27improvisation)


## Development

Use Visual Studio Code, and install recommended extensions.


### Models

To regenerate models with freezed, under `Explorer`, `Build Runner`, click the play icon.


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

# CI/CD

- https://github.com/marketplace/actions/flutter-action
- https://github.com/marketplace/actions/firebase-app-distribution

## iOS
- https://github.com/marketplace/actions/apple-provisioning-profile-action
- https://github.com/marketplace/actions/apple-certificate-action
- https://github.com/codemagic-ci-cd/cli-tools/blob/master/docs/xcode-project/use-profiles.md

## Android
- https://github.com/marketplace/actions/secret-to-file
