import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:toastification/toastification.dart';

import '../../components/bottom_sheet/bottom_sheet_dialog.dart';
import '../../cubits/integrations/integrations_cubit.dart';
import '../../cubits/matches/matches_cubit.dart';
import '../../cubits/pacings/pacings_cubit.dart';
import '../../integrations/integration_base.dart';
import '../../integrations/match_integration_base.dart';
import '../../integrations/pacing_integration_base.dart';
import '../../integrations/real_time_match_integration_base.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/match_model.dart';
import '../../models/pacing_model.dart';
import '../../router/routes.dart';
import '../../services/analytics_service.dart';
import '../../services/toaster_service.dart';
import '../match_detail/match_detail_page_shell.dart';
import '../pacings_search/pacings_search_page_view.dart';

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
      autoStart: true,
    );
    WidgetsBinding.instance.addObserver(this);
    _subscription = controller.barcodes.listen(handleBarcode);
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
        _subscription = controller.barcodes.listen(handleBarcode);
        controller.start();
      case AppLifecycleState.inactive:
        _subscription?.cancel();
        _subscription = null;
        controller.stop();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _subscription?.cancel();
    _subscription = null;
    controller.dispose();
    super.dispose();
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
          MobileScanner(controller: controller),
          _buildLoading(),
        ],
      ),
    );
  }

  Future<void> handleBarcode(BarcodeCapture barcodeCapture) async {
    final barcodeData = barcodeCapture.barcodes.first.rawValue;
    if (barcodeData == null) {
      return;
    }
    unawaited(controller.stop());
    final router = GoRouter.of(context);
    final pacingsCubit = context.read<PacingsCubit>();
    final matchesCubit = context.read<MatchesCubit>();
    final toasterService = context.read<ToasterService>();
    final analyticsService = context.read<AnalyticsService>();
    final localizer = S.of(context);

    final integrations = context.read<IntegrationsCubit>().state.integrations;
    for (final integration in integrations) {
      if (await integration.integrationIsValid(barcodeData)) {
        // Get pacing
        final pacing = await getPacing(integration, barcodeData);
        if (pacing == null) {
          toasterService.show(title: localizer.toasterGenericError, type: ToastificationType.error);
          unawaited(controller.start());
          return;
        }

        // Create pacing if integration is PacingIntegrationBase only
        if (integration is PacingIntegrationBase &&
            integration is! MatchIntegrationBase &&
            integration is! RealTimeMatchIntegrationBase) {
          final pacingModel = await pacingsCubit.add(pacing);
          if (pacingModel != null) {
            await analyticsService.logIntegration(integration);
            router.goNamed(Routes.pacing, pathParameters: {'id': '${pacingModel.id}'});
            return;
          } else {
            toasterService.show(title: localizer.toasterGenericError, type: ToastificationType.error);
            unawaited(controller.start());
            return;
          }
        }

        // Get match
        final match = await getMatch(integration, barcodeData, pacing);
        if (match == null) {
          toasterService.show(title: localizer.toasterGenericError, type: ToastificationType.error);
          unawaited(controller.start());
          return;
        }

        final matchModel = await matchesCubit.add(match);
        if (matchModel != null) {
          await analyticsService.logIntegration(integration);
          router.goNamed(Routes.match, pathParameters: {'id': '${matchModel.id}'});
          return;
        } else {
          toasterService.show(title: localizer.toasterGenericError, type: ToastificationType.error);
          unawaited(controller.start());
          return;
        }
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
          return const Center(child: CircularProgressIndicator());
        }

        return const SizedBox();
      },
    );
  }

  Future<PacingModel?> getPacing(IntegrationBase integration, String barcodeData) async {
    if (integration is PacingIntegrationBase) {
      try {
        return await integration.getPacing(barcodeData);
      } catch (e) {
        return null;
      }
    }

    final result = await PacingsSearchPageView.showDialog(context);
    return result;
  }

  Future<MatchModel?> getMatch(IntegrationBase integration, String barcodeData, PacingModel pacing) async {
    MatchModel? match;

    if (integration is MatchIntegrationBase) {
      try {
        match = await integration.getMatch(barcodeData, pacing);
      } catch (e) {
        return null;
      }
    }

    if (match == null && mounted) {
      match = await BottomSheetDialog.showDialog<MatchModel>(
        context: context,
        child: MatchDetailPageShell(
          pacing: pacing,
          onConfirm: (match, dialogContext) async {
            final navigator = Navigator.of(dialogContext);
            navigator.pop(match);
          },
        ),
      );
    }

    if (match == null) {
      return null;
    }

    if (integration is RealTimeMatchIntegrationBase) {
      match = await integration.enrichMatch(barcodeData, match);
    }

    return match;
  }
}
