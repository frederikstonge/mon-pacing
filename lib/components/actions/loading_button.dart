import 'dart:async';

import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  final _ButtonVariant _variant;
  final Widget? icon;
  final Widget child;
  final FutureOr<void> Function()? onPressed;

  const LoadingButton.filled({
    Key? key,
    required Widget child,
    required FutureOr<void> Function()? onPressed,
    String? tooltip,
  }) : this._(
          key: key,
          child: child,
          onPressed: onPressed,
          variant: _ButtonVariant.filled,
        );

  const LoadingButton.filledIcon({
    Key? key,
    required Widget child,
    required Widget icon,
    required FutureOr<void> Function()? onPressed,
    String? tooltip,
  }) : this._(
          key: key,
          child: child,
          onPressed: onPressed,
          icon: icon,
          variant: _ButtonVariant.filledIcon,
        );

  const LoadingButton.tonal({
    Key? key,
    required Widget child,
    required FutureOr<void> Function()? onPressed,
    String? tooltip,
  }) : this._(
          key: key,
          child: child,
          onPressed: onPressed,
          variant: _ButtonVariant.tonal,
        );

  const LoadingButton.tonalIcon({
    Key? key,
    required Widget child,
    required Widget icon,
    required FutureOr<void> Function()? onPressed,
    String? tooltip,
  }) : this._(
          key: key,
          child: child,
          onPressed: onPressed,
          icon: icon,
          variant: _ButtonVariant.tonalIcon,
        );

  const LoadingButton._({
    super.key,
    required this.child,
    required this.onPressed,
    this.icon,
    required _ButtonVariant variant,
  }) : _variant = variant;

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final onPressed = isLoading || widget.onPressed == null
        ? null
        : () async {
            setState(() {
              isLoading = true;
            });
            await widget.onPressed?.call();
            setState(() {
              isLoading = false;
            });
          };

    final child = isLoading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(),
          )
        : widget.child;

    return switch (widget._variant) {
      _ButtonVariant.filled => FilledButton(
          onPressed: onPressed,
          child: child,
        ),
      _ButtonVariant.filledIcon => FilledButton.icon(
          onPressed: onPressed,
          icon: widget.icon!,
          label: child,
        ),
      _ButtonVariant.tonal => FilledButton.tonal(
          onPressed: onPressed,
          child: child,
        ),
      _ButtonVariant.tonalIcon => FilledButton.tonalIcon(
          onPressed: onPressed,
          icon: widget.icon!,
          label: child,
        ),
    };
  }
}

enum _ButtonVariant {
  filled,
  filledIcon,
  tonal,
  tonalIcon,
}
