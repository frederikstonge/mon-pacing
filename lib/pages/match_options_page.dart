import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/match_cubit.dart';
import '../views/match_options_view.dart';

class MatchOptionsPage extends StatelessWidget {
  final MatchCubit bloc;
  final bool isNew;

  const MatchOptionsPage({super.key, required this.bloc, required this.isNew});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocProvider.value(
      value: bloc,
      child: MatchOptionsView(
        formKey: formKey,
        isNew: isNew,
      ),
    );
  }
}
