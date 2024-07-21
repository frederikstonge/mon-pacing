import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mon_pacing/repositories/pacings_repository.dart';
import 'package:mon_pacing/router/router.dart';

import 'app_wrapper.dart';
import 'data_helper.dart';

Future<void> takeScreenshot({
  required WidgetTester tester,
  required String path,
  required String pageName,
  required bool isFinal,
  required Size sizeDp,
  required double density,
  CustomPump? customPump,
}) async {
  await tester.pumpWidgetBuilder(getAppWrapper());

  final context = rootNavigatorKey.currentContext!;
  final goRouter = GoRouter.of(context);
  final pacingsRepository = context.read<PacingsRepository>();

  await pacingsRepository.add(
    DataHelper.getPacing(
      'Pacing #1',
      [],
    ),
  );

  goRouter.go(path);

  await multiScreenGolden(
    tester,
    pageName,
    customPump: customPump,
    devices: [
      Device(
        name: isFinal ? 'final' : 'screen',
        size: sizeDp,
        textScale: 1,
        devicePixelRatio: density,
      ),
    ],
  );
}
