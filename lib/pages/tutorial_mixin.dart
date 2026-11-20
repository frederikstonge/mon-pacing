import 'package:flutter/widgets.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

mixin TutorialMixin {
  TutorialCoachMark? _tutorialCoachMark;

  void initTutorialCoachMark({required List<TargetFocus> targets, void Function()? onFinish}) {
    _tutorialCoachMark?.removeOverlayEntry();
    _tutorialCoachMark = TutorialCoachMark(targets: targets, hideSkip: true, opacityShadow: 0.9, onFinish: onFinish);
  }

  void scheduleTutorialCoachMark(BuildContext context, {required bool Function() shouldShow}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted || !shouldShow() || (_tutorialCoachMark?.isShowing ?? false)) {
        return;
      }

      _tutorialCoachMark?.show(context: context, rootOverlay: true);
    });
  }

  void cancelTutorialCoachMark() {
    _tutorialCoachMark?.removeOverlayEntry();
    _tutorialCoachMark = null;
  }
}
