import 'package:flutter/widgets.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

mixin TutorialMixin {
  TutorialCoachMark? _tutorialCoachMark;

  /// Initializes the tutorial coach mark.
  void initTutorialCoachMark({required List<TargetFocus> targets}) {
    // Initialize the tutorial coach mark here.
    // This method should be called in the initState of the widget that uses this mixin.
    // Example:
    // TutorialCoachMark().show(context: context);
    _tutorialCoachMark = TutorialCoachMark(targets: targets, hideSkip: true, opacityShadow: 0.9);
  }

  /// Shows the tutorial coach mark.
  void showTutorialCoachMark(BuildContext context, void Function()? onFinish) {
    try {
      _tutorialCoachMark?.show(context: context, rootOverlay: true);
    } finally {
      onFinish?.call();
    }
  }
}
