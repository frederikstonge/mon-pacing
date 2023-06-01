import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/pacing/pacing_cubit.dart';
import 'pacing_options_view.dart';

class PacingOptionsPage extends StatelessWidget {
  final PacingCubit bloc;
  const PacingOptionsPage({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: const PacingOptionsView(),
    );
  }
}
