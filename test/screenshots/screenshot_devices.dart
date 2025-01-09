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

  /// iPhone 5.5" Display (the one with a home button)
  /// based on the iPhone 8 Plus.
  olderIphone(
    ScreenshotDevice(
      platform: TargetPlatform.iOS,
      resolution: Size(1242, 2208),
      pixelRatio: 3,
      goldenSubFolder: 'ios/',
      frameBuilder: ScreenshotFrame.olderIphone,
    ),
  ),

  /// iPhone 6.9" Display (the one without a home button)
  /// based on the iPhone 16 Pro Max.
  newerIphone(
    ScreenshotDevice(
      platform: TargetPlatform.iOS,
      resolution: Size(1320, 2868),
      pixelRatio: 3,
      goldenSubFolder: 'ios/',
      frameBuilder: ScreenshotFrame.newerIphone,
    ),
  ),

  /// iPad Pro 12.9" (2nd generation),
  /// labelled on App Store Connect as iPad 12.9" Display.
  ///
  /// This is the older type of iPad with thicker bezels and a home button.
  olderIpad(
    ScreenshotDevice(
      platform: TargetPlatform.iOS,
      resolution: Size(2048, 2732),
      pixelRatio: 2,
      goldenSubFolder: 'ios/',
      frameBuilder: ScreenshotFrame.olderIpad,
    ),
  ),

  /// iPad Pro 13" (M4),
  /// labelled on App Store Connect as iPad 13" Display.
  ///
  /// This is the newer type of iPad with thinner bezels and no home button.
  newerIpad(
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
