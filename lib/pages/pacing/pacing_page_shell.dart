import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/pacing/pacing_cubit.dart';
import '../../repositories/pacings_repository.dart';
import 'pacing_page_view.dart';

class PacingPageShell extends StatelessWidget {
  final int id;

  const PacingPageShell({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PacingCubit(
        pacingsRepository: context.read<PacingsRepository>(),
        id: id,
      )..initialize(),
      child: const PacingPageView(),
    );
  }
}
