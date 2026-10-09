import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:toastification/toastification.dart';

import '../../../cubits/integrations/integrations_cubit.dart';
import '../../../integrations/appimpro_integration.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../models/pacing_model.dart';
import '../../../services/toaster_service.dart';
import '../bottom_sheet/bottom_sheet_appbar.dart';
import '../bottom_sheet/bottom_sheet_scaffold.dart';
import '../buttons/loading_button.dart';

class PacingMenu extends StatelessWidget {
  final PacingModel pacing;
  final FutureOr<void> Function() startMatch;
  final FutureOr<void> Function()? edit;
  final FutureOr<void> Function()? editDetails;
  final FutureOr<void> Function() share;
  final FutureOr<void> Function() duplicate;
  final FutureOr<void> Function() delete;

  const PacingMenu({
    super.key,
    required this.pacing,
    required this.startMatch,
    required this.share,
    required this.duplicate,
    required this.delete,
    this.edit,
    this.editDetails,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(title: pacing.name),
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          if (editDetails != null) ...[
            InkWell(
              onTap: () async {
                Navigator.of(context).pop();
                await editDetails!.call();
              },
              child: ListTile(
                leading: const Icon(Icons.edit_document),
                title: Text(S.of(context).editDetails, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
          InkWell(
            onTap: () async {
              Navigator.of(context).pop();
              await startMatch.call();
            },
            child: ListTile(
              leading: const Icon(Icons.play_arrow),
              title: Text(S.of(context).startMatch, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
          if (edit != null) ...[
            InkWell(
              onTap: () async {
                Navigator.of(context).pop();
                await edit!.call();
              },
              child: ListTile(
                leading: const Icon(Icons.edit),
                title: Text(S.of(context).edit, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
          InkWell(
            onTap: () async {
              Navigator.of(context).pop();
              await share.call();
            },
            child: ListTile(
              leading: const Icon(Icons.share),
              title: Text(S.of(context).share, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
          if (_appImpro(context) != null) ...[
            InkWell(
              onTap: () async {
                final navigator = Navigator.of(context);
                final appImpro = _appImpro(context)!;
                final toasterService = context.read<ToasterService>();
                final localizer = S.of(context);
                navigator.pop();
                await _sendToAppImpro(navigator.context, appImpro, toasterService, localizer);
              },
              child: ListTile(
                leading: const Icon(Icons.send),
                title: Text(S.of(context).sendToAppImpro, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
          InkWell(
            onTap: () async {
              Navigator.of(context).pop();
              await duplicate.call();
            },
            child: ListTile(
              leading: const Icon(Icons.copy),
              title: Text(S.of(context).duplicate, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
          InkWell(
            onTap: () async {
              Navigator.of(context).pop();
              await delete.call();
            },
            child: ListTile(
              leading: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
              title: Text(
                S.of(context).delete,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppImproIntegration? _appImpro(BuildContext context) =>
      context.read<IntegrationsCubit>().state.integrations.whereType<AppImproIntegration>().firstOrNull;

  /// "Send to AppImpro": one-time copy of the pacing. Shows the 4-digit code
  /// the referee gives to the MC.
  Future<void> _sendToAppImpro(
    BuildContext context,
    AppImproIntegration appImpro,
    ToasterService toasterService,
    S localizer,
  ) async {
    AppImproSendResult result;
    try {
      result = await appImpro.sendPacing(pacing);
    } catch (_) {
      toasterService.show(title: localizer.toasterGenericError, type: ToastificationType.error);
      return;
    }
    if (!context.mounted) return;

    await showDialog<void>(
      context: context,
      useRootNavigator: true,
      useSafeArea: true,
      barrierColor: Theme.of(context).colorScheme.onSurface.withAlpha(100),
      builder: (dialogContext) => Dialog(
        backgroundColor: Theme.of(dialogContext).colorScheme.surface,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.of(dialogContext).appImproCode,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SelectableText(
                result.code,
                textAlign: TextAlign.center,
                style: Theme.of(dialogContext).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 12,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                S.of(dialogContext).appImproCodeDescription(minutes: result.expiresInMinutes),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              LoadingButton.filled(
                child: Text(
                  S.of(dialogContext).close,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onPressed: () => Navigator.of(dialogContext).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
