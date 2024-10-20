import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../integrations/integration_base.dart';
import '../../integrations/match_integration_base.dart';
import '../../integrations/pacing_integration_base.dart';
import '../../l10n/app_localizations.dart';
import '../../models/match_model.dart';
import '../../models/pacing_model.dart';
import '../../services/integration_service.dart';

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
    controller = MobileScannerController(torchEnabled: torchEnabled, facing: isBackCamera ? CameraFacing.back : CameraFacing.front);
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
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: MediaQuery.of(context).size.shortestSide / 2,
      height: MediaQuery.of(context).size.shortestSide / 2,
    );

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
      body: MobileScanner(
        controller: controller,
        scanWindow: scanWindow,
      ),
    );
  }

  void _handleBarcode(BarcodeCapture barcodeCapture) {
    final barcodeData = barcodeCapture.barcodes.first.rawValue;
    if (barcodeData == null) {
      return;
    }

    final integrations = context.read<IntegrationService>().getIntegrationsByType<IntegrationBase>();
    for (final integration in integrations) {
      if (integration.integrationIsValid(barcodeCapture.barcodes.first.rawValue!)) {
        PacingModel? pacing;
        MatchModel? match;
        if (integration is PacingIntegrationBase) {
          pacing = integration.getPacing(barcodeData);
        }

        if (integration is MatchIntegrationBase) {
          if (pacing == null) {
            // Prompt pacing selection
          }

          match = integration.getMatch(barcodeData, pacing!);
        }

        if (pacing != null && match == null) {
          // Create pacing
        } else if (match != null) {
          // Create match
        }

        return;
      }
    }

    // No integration found
  }
}
