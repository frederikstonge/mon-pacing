import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../cubits/settings/settings_cubit.dart';

class HapticSwitch extends StatelessWidget {
  final bool value;
  final FutureOr<void> Function(bool value)? onChanged;

  const HapticSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged != null
          ? (value) async {
              unawaited(context.read<SettingsCubit>().vibrate(HapticsType.light));
              return await onChanged!.call(value);
            }
          : null,
    );
  }
}
