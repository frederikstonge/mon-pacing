import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    this.inputHeight = 42,
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
    return Container(
      height: widget.inputHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: widget.hasError ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.primary,
          width: 2,
        ),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: canRemove()
                ? () async {
                    var value = int.tryParse(_controller.text);
                    if (value != null) {
                      value = value - widget.multiple;
                    }

                    value = _correct(value);
                    _controller.text = value.toString();
                    await widget.onChanged(value);
                  }
                : null,
            icon: const Icon(Icons.remove),
          ),
          Flexible(
            child: SizedBox(
              width: widget.inputWidth,
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(border: InputBorder.none, isDense: true),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) async => await widget.onChanged(int.tryParse(value)),
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
          ),
          IconButton(
            onPressed: canAdd()
                ? () async {
                    var value = int.tryParse(_controller.text);
                    if (value != null) {
                      value = value + widget.multiple;
                    }

                    value = _correct(value);
                    _controller.text = value.toString();
                    await widget.onChanged(value);
                  }
                : null,
            icon: const Icon(Icons.add),
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
    if (widget.maxValue == null) {
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

    if (widget.minValue != null && number < widget.minValue!) {
      return widget.minValue!;
    }

    if (widget.maxValue != null && number > widget.maxValue!) {
      return widget.maxValue!;
    }

    final difference = number % widget.multiple;
    if (difference != 0) {
      if (difference < widget.multiple / 2) {
        return number - (widget.multiple - difference);
      } else {
        return number + difference;
      }
    }

    return number;
  }
}
