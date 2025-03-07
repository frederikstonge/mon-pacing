import 'dart:async';

import 'package:flutter/material.dart';

class LoadingIconButton extends StatefulWidget {
  final _IconButtonVariant _variant;
  final IconButtonSize size;
  final Widget icon;
  final String? tooltip;
  final FutureOr<void> Function()? onPressed;

  const LoadingIconButton({
    Key? key,
    required Widget icon,
    required FutureOr<void> Function()? onPressed,
    String? tooltip,
    IconButtonSize size = IconButtonSize.medium,
  }) : this._(
         key: key,
         icon: icon,
         onPressed: onPressed,
         tooltip: tooltip,
         variant: _IconButtonVariant.normal,
         size: size,
       );

  const LoadingIconButton.filled({
    Key? key,
    required Widget icon,
    required FutureOr<void> Function()? onPressed,
    String? tooltip,
    IconButtonSize size = IconButtonSize.medium,
  }) : this._(
         key: key,
         icon: icon,
         onPressed: onPressed,
         tooltip: tooltip,
         variant: _IconButtonVariant.filled,
         size: size,
       );

  const LoadingIconButton.tonal({
    Key? key,
    required Widget icon,
    required FutureOr<void> Function()? onPressed,
    String? tooltip,
    IconButtonSize size = IconButtonSize.medium,
  }) : this._(
         key: key,
         icon: icon,
         onPressed: onPressed,
         tooltip: tooltip,
         variant: _IconButtonVariant.tonal,
         size: size,
       );

  const LoadingIconButton._({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    required _IconButtonVariant variant,
    required this.size,
  }) : _variant = variant;

  @override
  State<LoadingIconButton> createState() => _LoadingIconButtonState();
}

class _LoadingIconButtonState extends State<LoadingIconButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final onPressed =
        isLoading || widget.onPressed == null
            ? null
            : () async {
              setState(() {
                isLoading = true;
              });
              try {
                await widget.onPressed?.call();
              } finally {
                if (mounted) {
                  setState(() {
                    isLoading = false;
                  });
                }
              }
            };

    final icon = isLoading ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator()) : widget.icon;

    const padding = EdgeInsets.zero;
    final constraints = BoxConstraints.tight(switch (widget.size) {
      IconButtonSize.small => const Size(20.0, 20.0),
      IconButtonSize.medium => const Size(40.0, 40.0),
      IconButtonSize.large => const Size(60.0, 60.0),
    });

    final iconSize = switch (widget.size) {
      IconButtonSize.small => 12.0,
      IconButtonSize.medium => 24.0,
      IconButtonSize.large => 36.0,
    };

    return switch (widget._variant) {
      _IconButtonVariant.normal => IconButton(
        tooltip: widget.tooltip,
        onPressed: onPressed,
        icon: icon,
        padding: padding,
        constraints: constraints,
        iconSize: iconSize,
      ),
      _IconButtonVariant.filled => IconButton.filled(
        tooltip: widget.tooltip,
        onPressed: onPressed,
        icon: icon,
        padding: padding,
        constraints: constraints,
        iconSize: iconSize,
      ),
      _IconButtonVariant.tonal => IconButton.filledTonal(
        tooltip: widget.tooltip,
        onPressed: onPressed,
        icon: icon,
        padding: padding,
        constraints: constraints,
        iconSize: iconSize,
      ),
    };
  }
}

enum _IconButtonVariant { normal, filled, tonal }

enum IconButtonSize { small, medium, large }
