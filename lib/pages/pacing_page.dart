import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubits/pacing_cubit.dart';
import '../generated/l10n.dart';
import '../models/pacing_model.dart';
import '../views/pacing_view.dart';

class PacingPage extends StatelessWidget {
  final PacingModel? model;
  const PacingPage({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PacingCubit(
        model: model ??
            PacingModel(
              createdDate: null,
              id: null,
              modifiedDate: null,
              name: S.of(context).PacingPage_NewPacingName(DateFormat.yMd().add_jm().format(DateTime.now())),
              improvisations: [],
            ),
      ),
      child: PacingView(model: model),
    );
  }
}
