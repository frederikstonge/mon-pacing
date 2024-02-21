import 'package:flutter/material.dart';

import '../../../components/custom_card/custom_card.dart';
import '../../../models/pacing_model.dart';

class PacingCard extends StatelessWidget {
  final PacingModel pacing;

  const PacingCard({
    super.key,
    required this.pacing,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(child: Text(pacing.name));
  }
}
