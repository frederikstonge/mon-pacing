import 'dart:async';

import 'package:flutter/material.dart';

import '../../validators/validators.dart';
import 'quantity_stepper.dart';

class QuantityStepperFormField extends FormField<int> {
  final double inputWidth;
  final double inputHeight;
  final int? minValue;
  final int? maxValue;
  final int multiple;

  final FutureOr<void> Function(int? value) onChanged;

  QuantityStepperFormField({
    super.key,
    required super.initialValue,
    required this.onChanged,
    this.inputWidth = 48,
    this.inputHeight = 42,
    this.minValue,
    this.maxValue,
    this.multiple = 1,
    super.autovalidateMode,
    super.enabled,
    super.onSaved,
    super.restorationId,
  }) : super(
         validator: (value) =>
             Validators.intRequired(value) ??
             Validators.greaterThan(value!, minValue) ??
             Validators.lesserThan(value!, maxValue) ??
             Validators.intMultipleOf(value!, multiple),
         builder: (FormFieldState<int> state) => Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisSize: MainAxisSize.min,
           children: [
             QuantityStepper(
               initialValue: state.value ?? initialValue ?? minValue ?? multiple,
               onChanged: (value) async {
                 state.didChange(value);
                 await onChanged.call(value);
               },
               inputHeight: inputHeight,
               inputWidth: inputWidth,
               minValue: minValue,
               maxValue: maxValue,
               multiple: multiple,
               hasError: state.hasError,
             ),
             if (state.hasError && state.errorText != null) ...[
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                 child: Text(
                   state.errorText!,
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                   style: Theme.of(
                     state.context,
                   ).textTheme.labelSmall!.copyWith(color: Theme.of(state.context).colorScheme.error),
                 ),
               ),
             ],
           ],
         ),
       );
}
