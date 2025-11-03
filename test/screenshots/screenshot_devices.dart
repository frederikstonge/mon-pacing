import 'package:flutter/widgets.dart';
import 'package:golden_screenshot/golden_screenshot.dart';

/// The default set of [ScreenshotDevice]s.
enum CustomGoldenScreenshotDevices {
  android10InchTablet(
    ScreenshotDevice(
      platform: TargetPlatform.android,
      resolution: Size(2048, 2732),
      pixelRatio: 2,
      goldenSubFolder: 'android/tenInchScreenshots/',
      frameBuilder: ScreenshotFrame.androidTablet,
    ),
  ),

  android7InchTablet(
    ScreenshotDevice(
      platform: TargetPlatform.android,
      resolution: Size(2048, 2732),
      pixelRatio: 2,
      goldenSubFolder: 'android/sevenInchScreenshots/',
      frameBuilder: ScreenshotFrame.androidTablet,
    ),
  ),

  /// An Android phone based on the Pixel 6 Pro.
  androidPhone(
    ScreenshotDevice(
      platform: TargetPlatform.android,
      resolution: Size(1080, 2340),
      pixelRatio: 2.5,
      goldenSubFolder: 'android/phoneScreenshots/',
      frameBuilder: ScreenshotFrame.androidPhone,
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
      frameBuilder: ScreenshotFrame.iphone,
    ),
  ),

  /// iPad Pro 13" (M4),
  /// labelled on App Store Connect as iPad 13" Display.
  ///
  /// This is the newer type of iPad with thinner bezels and no home button.
  iPad(
    ScreenshotDevice(
      platform: TargetPlatform.iOS,
      resolution: Size(2048, 2732),
      pixelRatio: 2,
      goldenSubFolder: 'ios/',
      frameBuilder: ScreenshotFrame.ipad,
    ),
  ),

  /// iPad Pro 3rd GEN 12.9" (M1),
  /// labelled on App Store Connect as iPad 13" Display.
  ///
  /// This is the newer type of iPad with thinner bezels and no home button.
  olderIPad(
    ScreenshotDevice(
      platform: TargetPlatform.iOS,
      resolution: Size(2048, 2732),
      pixelRatio: 2,
      goldenSubFolder: 'ios/',
      frameBuilder: ScreenshotFrame.ipad,
    ),
  );

  const CustomGoldenScreenshotDevices(this.device);
  final ScreenshotDevice device;
}
