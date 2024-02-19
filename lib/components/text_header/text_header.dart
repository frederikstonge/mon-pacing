import 'package:flutter/material.dart';

class TextHeader extends StatelessWidget {
  final String title;

  const TextHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const Divider(),
      ],
    );
  }
}
