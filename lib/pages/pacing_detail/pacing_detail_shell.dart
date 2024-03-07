import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/settings/settings_cubit.dart';
import '../../models/pacing_model.dart';
import 'cubits/pacing_detail_cubit.dart';
import 'pacing_detail_view.dart';

class PacingDetailShell extends StatelessWidget {
  final PacingModel? pacing;
  final FutureOr<void> Function(PacingModel value) onConfirm;

  const PacingDetailShell({
    super.key,
    required this.onConfirm,
    this.pacing,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PacingDetailCubit(
        settingsCubit: context.read<SettingsCubit>(),
        onConfirm: onConfirm,
        pacing: pacing,
      ),
      child: const PacingDetailView(),
    );
  }
}
