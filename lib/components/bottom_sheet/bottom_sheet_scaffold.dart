import 'package:flutter/widgets.dart';

class BottomSheetScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottom;
  final bool isBodyExpanded;

  const BottomSheetScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.bottom,
    this.isBodyExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (appBar != null) ...[
          appBar!,
        ],
        if (isBodyExpanded) ...[
          Expanded(
            child: SingleChildScrollView(
              child: body,
            ),
          ),
        ] else ...[
          Flexible(
            child: SingleChildScrollView(
              child: body,
            ),
          ),
        ],
        if (bottom != null) ...[
          bottom!,
        ],
      ],
    );
  }
}
