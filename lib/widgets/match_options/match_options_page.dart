import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/match_cubit.dart';
import 'match_options_view.dart';

class MatchOptionsPage extends StatelessWidget {
  final MatchCubit bloc;

  const MatchOptionsPage({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: const MatchOptionsView(),
    );
  }
}
