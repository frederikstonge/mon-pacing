import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/pacing_model.dart';
import 'cubits/pacing_detail_cubit.dart';
import 'pacing_detail_page_view.dart';

class PacingDetailPageShell extends StatelessWidget {
  final PacingModel? pacing;
  final bool editMode;
  final FutureOr<void> Function(PacingModel value) onConfirm;

  const PacingDetailPageShell({
    super.key,
    required this.onConfirm,
    required this.editMode,
    this.pacing,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PacingDetailCubit(
        editMode: editMode,
        onConfirm: onConfirm,
        pacing: pacing,
      ),
      child: const PacingDetailPageView(),
    );
  }
}
