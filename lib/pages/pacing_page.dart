import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/pacing_cubit.dart';
import '../models/pacing_model.dart';
import '../views/pacing_view.dart';

class PacingPage extends StatelessWidget {
  final PacingModel? model;
  const PacingPage({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PacingCubit(
        model: model ??
            PacingModel(
              createdDate: null,
              id: null,
              modifiedDate: null,
              name: null,
            ),
      ),
      child: const PacingView(),
    );
  }
}
