import 'dart:async';

import 'package:flutter/material.dart';

class LoadingIconButton extends StatefulWidget {
  final _IconButtonVariant _variant;
  final Widget icon;
  final String? tooltip;
  final FutureOr<void> Function()? onPressed;

  const LoadingIconButton({
    Key? key,
    required Widget icon,
    required FutureOr<void> Function()? onPressed,
    String? tooltip,
  }) : this._(
          key: key,
          icon: icon,
          onPressed: onPressed,
          tooltip: tooltip,
          variant: _IconButtonVariant.normal,
        );

  const LoadingIconButton.filled({
    Key? key,
    required Widget icon,
    required FutureOr<void> Function()? onPressed,
    String? tooltip,
  }) : this._(
          key: key,
          icon: icon,
          onPressed: onPressed,
          tooltip: tooltip,
          variant: _IconButtonVariant.filled,
        );

  const LoadingIconButton._({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    required _IconButtonVariant variant,
  }) : _variant = variant;

  @override
  State<LoadingIconButton> createState() => _LoadingIconButtonState();
}

class _LoadingIconButtonState extends State<LoadingIconButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final onPressed = isLoading || widget.onPressed == null
        ? null
        : () async {
            setState(() {
              isLoading = true;
            });
            try {
              await widget.onPressed?.call();
            } finally {
              setState(() {
                isLoading = false;
              });
            }
          };

    final icon = isLoading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(),
          )
        : widget.icon;

    return switch (widget._variant) {
      _IconButtonVariant.normal => IconButton(
          tooltip: widget.tooltip,
          onPressed: onPressed,
          icon: icon,
        ),
      _IconButtonVariant.filled => IconButton.filled(
          tooltip: widget.tooltip,
          onPressed: onPressed,
          icon: icon,
        ),
    };
  }
}

enum _IconButtonVariant {
  normal,
  filled,
}
