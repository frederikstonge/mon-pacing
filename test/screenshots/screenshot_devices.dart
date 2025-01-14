import 'package:flutter/widgets.dart';
import 'package:golden_screenshot/golden_screenshot.dart';

/// The default set of [ScreenshotDevice]s.
enum CustomGoldenScreenshotDevices {
  android10InchTablet(
    ScreenshotDevice(
      platform: TargetPlatform.android,
      resolution: Size(1600, 2560),
      pixelRatio: 2,
      goldenSubFolder: 'android/tenInchScreenshots/',
      frameBuilder: ScreenshotFrame.noFrame,
    ),
  ),

  android7InchTablet(
    ScreenshotDevice(
      platform: TargetPlatform.android,
      resolution: Size(1600, 2560),
      pixelRatio: 2,
      goldenSubFolder: 'android/sevenInchScreenshots/',
      frameBuilder: ScreenshotFrame.noFrame,
    ),
  ),

  /// An Android phone based on the Pixel 6 Pro.
  androidPhone(
    ScreenshotDevice(
      platform: TargetPlatform.android,
      resolution: Size(1440, 3120),
      pixelRatio: 10 / 3,
      goldenSubFolder: 'android/phoneScreenshots/',
      frameBuilder: ScreenshotFrame.android,
    ),
  ),

  /// iPhone 6.9" Display (the one without a home button)
  /// based on the iPhone 14 Pro Max.
  iPhone(
    ScreenshotDevice(
      platform: TargetPlatform.iOS,
      resolution: Size(1290, 2796),
      pixelRatio: 3,
      goldenSubFolder: 'ios/',
      frameBuilder: ScreenshotFrame.newerIphone,
    ),
  ),

  /// iPad Pro 13" (M4),
  /// labelled on App Store Connect as iPad 13" Display.
  ///
  /// This is the newer type of iPad with thinner bezels and no home button.
  iPad(
    ScreenshotDevice(
      platform: TargetPlatform.iOS,
      resolution: Size(2064, 2752),
      pixelRatio: 2,
      goldenSubFolder: 'ios/',
      frameBuilder: ScreenshotFrame.newerIpad,
    ),
  );

  const CustomGoldenScreenshotDevices(this.device);
  final ScreenshotDevice device;
}
