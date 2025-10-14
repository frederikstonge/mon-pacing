import 'package:dart_mappable/dart_mappable.dart';

import '../../models/constants.dart';
import '../../models/improvisation_fields.dart';
import '../../models/penalties_impact_type.dart';
import '../../models/theme_type.dart';

part 'settings_state.mapper.dart';

@MappableClass()
class SettingsState with SettingsStateMappable {
  final String language;
  final ThemeType theme;
  final bool enableWakelock;
  final bool enableHapticFeedback;
  final bool enableTimerHapticFeedback;
  final int defaultNumberOfTeams;
  final int defaultImprovisationDurationInSeconds;
  final int defaultTimeBufferInSeconds;
  final int defaultHuddleTimerInSeconds;
  final bool defaultEnableStatistics;
  final bool enableDefaultPenaltiesImpactPoints;
  final PenaltiesImpactType defaultPenaltiesImpactType;
  final int defaultPenaltiesRequiredToImpactPoints;
  final bool enableDefaultMatchExpulsion;
  final int defaultPenaltiesRequiredToExpel;
  final List<ImprovisationFields> improvisationFieldsOrder;

  const SettingsState({
    required this.language,
    required this.theme,
    this.enableWakelock = true,
    this.enableHapticFeedback = true,
    this.enableTimerHapticFeedback = true,
    this.defaultNumberOfTeams = 2,
    this.defaultImprovisationDurationInSeconds = 150,
    this.defaultTimeBufferInSeconds = 30,
    this.defaultHuddleTimerInSeconds = 30,
    this.defaultEnableStatistics = false,
    this.enableDefaultPenaltiesImpactPoints = true,
    this.defaultPenaltiesImpactType = PenaltiesImpactType.addPoints,
    this.defaultPenaltiesRequiredToImpactPoints = 3,
    this.enableDefaultMatchExpulsion = true,
    this.defaultPenaltiesRequiredToExpel = 3,
    this.improvisationFieldsOrder = Constants.defaultImprovisationFieldsOrder,
  });
}
