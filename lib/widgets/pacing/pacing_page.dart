import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/pacing/pacing_cubit.dart';
import '../../repositories/pacings_repository.dart';
import 'pacing_view.dart';

class PacingPage extends StatelessWidget {
  final int id;
  const PacingPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PacingCubit(
        pacingsRepository: context.read<PacingsRepository>(),
        id: id,
      )..initialize(),
      child: const PacingView(),
    );
  }
}
