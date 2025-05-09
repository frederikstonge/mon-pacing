import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import '../../cubits/migration/migration_cubit.dart';
import '../../cubits/migration/migration_state.dart';

class MigrationDialog extends StatefulWidget {
  final Widget child;

  const MigrationDialog({super.key, required this.child});

  @override
  State<MigrationDialog> createState() => _MigrationDialogState();
}

class _MigrationDialogState extends State<MigrationDialog> {
  late ProgressDialog pd;

  @override
  void initState() {
    pd = ProgressDialog(context: context, useRootNavigator: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MigrationCubit, MigrationState>(
      listener: (context, state) {
        switch (state.status) {
          case MigrationStatus.initial:
            break;
          case MigrationStatus.running:
            if (pd.isOpen()) {
              pd.update(msg: state.title, value: state.count);
            } else {
              pd.show(
                msg: state.title ?? '',
                max: state.total ?? 0,
                progressType: state.total != null ? ProgressType.determinate : ProgressType.indeterminate,
                barrierColor: Theme.of(context).colorScheme.onSurface.withAlpha(100),
                backgroundColor: Theme.of(context).colorScheme.surface,
                msgColor: Theme.of(context).colorScheme.onSurface,
                valueColor: Theme.of(context).colorScheme.primary,
                progressBgColor: Theme.of(context).colorScheme.surface,
                progressValueColor: Theme.of(context).colorScheme.primary,
                closeWithDelay: 1000,
              );
            }
            break;
          case MigrationStatus.error:
            pd.update(msg: state.errorMessage ?? '');
            pd.close(delay: 1000);
            break;
          case MigrationStatus.success:
            pd.update(msg: state.title ?? '');
            pd.close(delay: 1000);
            break;
        }
      },
      child: widget.child,
    );
  }
}
