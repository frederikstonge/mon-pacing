import 'dart:async';

import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

import '../../l10n/generated/app_localizations.dart';
import '../buttons/loading_icon_button.dart';

class QuantityStepper extends StatefulWidget {
  final int initialValue;
  final double inputWidth;
  final double inputHeight;
  final int? minValue;
  final int? maxValue;
  final int multiple;
  final FutureOr<void> Function(int? value) onChanged;
  final bool hasError;

  const QuantityStepper({
    super.key,
    required this.initialValue,
    required this.onChanged,
    this.inputWidth = 48,
    this.inputHeight = 48,
    this.minValue,
    this.maxValue,
    this.multiple = 1,
    this.hasError = false,
  });

  @override
  State<QuantityStepper> createState() => _QuantityStepperState();
}

class _QuantityStepperState extends State<QuantityStepper> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialValue.toString());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textScale = MediaQuery.textScalerOf(context).scale(14) / 14;
    final height = widget.inputHeight * (textScale > 1 ? textScale : 1);
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: widget.hasError ? colors.error : colors.outlineVariant),
        color: colors.primaryContainer,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 48,
            height: height,
            child: LoadingIconButton(
              tooltip: S.of(context).remove,
              onPressed: canRemove()
                  ? () async {
                      final current = int.tryParse(_controller.text);
                      final value = _correct(current == null ? null : current - widget.multiple);
                      setState(() => _controller.text = value.toString());
                      await widget.onChanged(value);
                    }
                  : null,
              icon: Icon(
                Icons.remove,
                color: canRemove() ? colors.onPrimaryContainer : colors.onPrimaryContainer.withValues(alpha: 0.38),
              ),
            ),
          ),
          Flexible(
            child: Container(
              width: widget.inputWidth * (textScale > 1 ? textScale : 1),
              height: height > 8 ? height - 8 : height,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: colors.surface, borderRadius: BorderRadius.circular(8)),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  filled: false,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) async {
                  setState(() {});
                  await widget.onChanged(int.tryParse(value));
                },
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
          ),
          SizedBox(
            width: 48,
            height: height,
            child: LoadingIconButton(
              tooltip: S.of(context).add,
              onPressed: canAdd()
                  ? () async {
                      final current = int.tryParse(_controller.text);
                      final value = _correct(current == null ? null : current + widget.multiple);
                      setState(() => _controller.text = value.toString());
                      await widget.onChanged(value);
                    }
                  : null,
              icon: Icon(
                Icons.add,
                color: canAdd() ? colors.onPrimaryContainer : colors.onPrimaryContainer.withValues(alpha: 0.38),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool canAdd() {
    if (widget.maxValue == null) {
      return true;
    }

    final value = int.tryParse(_controller.text);
    if (value == null) {
      return true;
    }

    return value < widget.maxValue!;
  }

  bool canRemove() {
    if (widget.minValue == null) {
      return true;
    }

    final value = int.tryParse(_controller.text);
    if (value == null) {
      return true;
    }

    return value > widget.minValue!;
  }

  int _correct(int? number) {
    if (number == null) {
      return widget.initialValue;
    }

    final difference = number % widget.multiple;
    if (difference != 0) {
      if (difference < widget.multiple / 2) {
        number -= difference;
      } else {
        number += widget.multiple - difference;
      }
    }
    if (widget.minValue != null && number < widget.minValue!) return widget.minValue!;
    if (widget.maxValue != null && number > widget.maxValue!) return widget.maxValue!;
    return number;
  }
}
