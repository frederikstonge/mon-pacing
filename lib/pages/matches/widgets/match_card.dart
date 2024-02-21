import 'package:flutter/material.dart';

import '../../../components/custom_card/custom_card.dart';
import '../../../models/match_model.dart';

class MatchCard extends StatelessWidget {
  final MatchModel match;

  const MatchCard({
    super.key,
    required this.match,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(child: Text(match.name));
  }
}
