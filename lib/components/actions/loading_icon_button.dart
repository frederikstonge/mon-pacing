import 'dart:async';

import 'package:flutter/material.dart';

class LoadingIconButton extends StatefulWidget {
  final Widget icon;
  final String? tooltip;
  final FutureOr<void> Function()? onPressed;

  const LoadingIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
  });

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
            await widget.onPressed?.call();
            setState(() {
              isLoading = false;
            });
          };

    final icon = isLoading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(),
          )
        : widget.icon;

    return IconButton(
      tooltip: widget.tooltip,
      onPressed: onPressed,
      icon: icon,
    );
  }

  Future<void> onPressed() async {}
}
