import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/pacing_cubit.dart';
import '../views/pacing_options_view.dart';

class PacingOptionsPage extends StatelessWidget {
  final PacingCubit bloc;
  const PacingOptionsPage({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocProvider.value(
      value: bloc,
      child: PacingOptionsView(formKey: formKey),
    );
  }
}
