import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/pacing_model.dart';
import 'pacing_cubit.dart';
import 'pacing_view.dart';

class PacingPage extends StatelessWidget {
  final PacingModel model;
  const PacingPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PacingCubit(model: model),
      child: PacingView(model: model),
    );
  }
}
