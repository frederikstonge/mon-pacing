import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:path_provider/path_provider.dart';

import 'bootstrapper.dart';
import 'firebase_options.dart';
import 'models/tag_model.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // FIREBASE
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

      await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(!kDebugMode);

      // BLOC
      final storageDirectory = await getApplicationDocumentsDirectory();
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: HydratedStorageDirectory(storageDirectory.path),
      );

      // DART_MAPPABLE
      // Used to be backward compatible with old exported pacings
      MapperContainer.globals.use(TagMapper());

      // APP
      runApp(const Bootstrapper());
    },
    (error, stackTrace) {
      // Log the error and stack trace
    },
  );
}
