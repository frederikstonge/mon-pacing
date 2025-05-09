import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'bootstrapper.dart';
import 'firebase_options.dart';
import 'models/tag_model.dart';

Future<void> main() async {
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true, printDetails: kDebugMode);
    return true;
  };

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // FIREBASE
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode);
      await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(!kDebugMode);

      await FirebaseRemoteConfig.instance.setConfigSettings(
        RemoteConfigSettings(fetchTimeout: const Duration(minutes: 1), minimumFetchInterval: const Duration(hours: 6)),
      );

      // SYSTEM CHROME
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

      // BLOC
      final storageDirectory = await getApplicationDocumentsDirectory();
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: HydratedStorageDirectory(storageDirectory.path),
      );

      // DART_MAPPABLE
      MapperContainer.globals.use(TagMapper());

      // APP
      runApp(const Bootstrapper());
    },
    (error, stackTrace) {
      FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true, printDetails: kDebugMode);
    },
  );
}
