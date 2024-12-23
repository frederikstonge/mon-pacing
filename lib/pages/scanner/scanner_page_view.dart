import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:toastification/toastification.dart';

import '../../components/search/pacings_search.dart';
import '../../cubits/matches/matches_cubit.dart';
import '../../cubits/pacings/pacings_cubit.dart';
import '../../integrations/integration_base.dart';
import '../../integrations/match_integration_base.dart';
import '../../integrations/pacing_integration_base.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/match_model.dart';
import '../../models/pacing_model.dart';
import '../../repositories/pacings_repository.dart';
import '../../router/routes.dart';
import '../../services/integration_service.dart';
import '../../services/toaster_service.dart';

class ScannerPageView extends StatefulWidget {
  const ScannerPageView({super.key});

  @override
  State<ScannerPageView> createState() => _ScannerPageViewState();
}

class _ScannerPageViewState extends State<ScannerPageView> with WidgetsBindingObserver {
  bool torchEnabled = false;
  bool isBackCamera = true;
  late final MobileScannerController controller;
  StreamSubscription<Object?>? _subscription;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController(
      torchEnabled: torchEnabled,
      facing: isBackCamera ? CameraFacing.back : CameraFacing.front,
      autoStart: false,
    );
    WidgetsBinding.instance.addObserver(this);
    _subscription = controller.barcodes.listen(_handleBarcode);
    unawaited(controller.start());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!controller.value.hasCameraPermission) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        _subscription = controller.barcodes.listen(_handleBarcode);
        unawaited(controller.start());
      case AppLifecycleState.inactive:
        unawaited(_subscription?.cancel());
        _subscription = null;
        unawaited(controller.stop());
    }
  }

  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_subscription?.cancel());
    _subscription = null;
    super.dispose();
    await controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).scanner),
        actions: [
          IconButton(
            icon: Icon(torchEnabled ? Icons.flash_on : Icons.flash_off),
            onPressed: () async {
              await controller.toggleTorch();
              setState(() {
                torchEnabled = !torchEnabled;
              });
            },
          ),
          IconButton(
            icon: Icon(isBackCamera ? Icons.camera_rear : Icons.camera_front),
            onPressed: () async {
              await controller.switchCamera();
              setState(() {
                isBackCamera = !isBackCamera;
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
          ),
          _buildLoading(),
        ],
      ),
    );
  }

  Future<void> _handleBarcode(BarcodeCapture barcodeCapture) async {
    final barcodeData = barcodeCapture.barcodes.first.rawValue;
    if (barcodeData == null) {
      return;
    }
    unawaited(controller.stop());
    final router = GoRouter.of(context);
    final pacingsRepository = context.read<PacingsRepository>();
    final pacingsCubit = context.read<PacingsCubit>();
    final matchesCubit = context.read<MatchesCubit>();
    final toasterService = context.read<ToasterService>();
    final localizer = S.of(context);

    final integrations = context.read<IntegrationService>().getIntegrationsByType<IntegrationBase>();
    for (final integration in integrations) {
      if (await integration.integrationIsValid(barcodeCapture.barcodes.first.rawValue!)) {
        PacingModel? pacing;
        MatchModel? match;
        if (integration is PacingIntegrationBase) {
          pacing = await integration.getPacing(barcodeData);
        }

        if (integration is MatchIntegrationBase) {
          if (pacing == null) {
            if (!mounted) {
              unawaited(controller.start());
              return;
            }

            final result = await PacingsSearch.showDialog(
              context,
              pacingsRepository.search,
              pacingsRepository.getAllTags,
            );

            if (result == null) {
              // No pacing selected, restart scanner
              unawaited(controller.start());
              return;
            }

            pacing = result;
          }
          try {
            match = await integration.getMatch(barcodeData, pacing);
          } catch (e) {
            unawaited(controller.start());
            toasterService.show(
              title: localizer.toasterGenericError,
              description: e.toString(),
              type: ToastificationType.error,
            );
            return;
          }
        }

        // Create pacing
        if (pacing != null && match == null) {
          final pacingModel = await pacingsCubit.add(pacing);
          if (pacingModel != null) {
            router.goNamed(Routes.pacing, pathParameters: {'id': '${pacingModel.id}'});
            return;
          } else {
            toasterService.show(
              title: localizer.toasterGenericError,
              type: ToastificationType.error,
            );
          }
        }
        // Create match
        else if (match != null) {
          final matchModel = await matchesCubit.add(match);
          if (matchModel != null) {
            router.goNamed(Routes.match, pathParameters: {'id': '${matchModel.id}'});
            return;
          } else {
            toasterService.show(
              title: localizer.toasterGenericError,
              type: ToastificationType.error,
            );
          }
        }

        // Integration found but no pacing or match created, restart scanner
        unawaited(controller.start());
        return;
      }
    }

    // No integration found, restart scanner
    unawaited(controller.start());
    toasterService.show(
      title: localizer.toasterGenericError,
      description: localizer.noIntegrationFound,
      type: ToastificationType.error,
    );
  }

  Widget _buildLoading() {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) {
        // Not ready.
        if (!value.isInitialized || !value.isRunning || value.error != null || value.size.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return const SizedBox();
      },
    );
  }
}
