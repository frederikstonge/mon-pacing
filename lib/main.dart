import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monpacing/pages/matches/matches_page.dart';
import 'package:monpacing/pages/pacings/pacings_page.dart';
import 'package:monpacing/pages/settings/settings_page.dart';

import 'pages/home/home_page.dart';
import 'repositories/pacings_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => PacingsRepository(),
        ),
      ],
      child: MaterialApp(
        title: 'MonPacing',
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: const HomePage(
          pages: [
            PacingsPage(),
            MatchesPage(),
            SettingsPage(),
          ],
        ),
      ),
    );
  }
}
