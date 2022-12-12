import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension PaddingExtension on BuildContext {
  // Vertical
  EdgeInsets get horizantalPaddingBase => EdgeInsets.symmetric(horizontal: 4.w);
  EdgeInsets get horizantalPaddingSmall => EdgeInsets.symmetric(horizontal: 12.w);
  EdgeInsets get horizantalPaddingMedium => EdgeInsets.symmetric(horizontal: 16.w);
  EdgeInsets get horizantalPaddingLarge => EdgeInsets.symmetric(horizontal: 20.w);
  EdgeInsets get horizantalPaddingXlarge => EdgeInsets.symmetric(horizontal: 24.w);
  EdgeInsets get horizantalPaddingXXlarrge => EdgeInsets.symmetric(horizontal: 64.w);

  // Horizantal
  EdgeInsets get verticalPaddingBase => EdgeInsets.symmetric(vertical: 4.h);
  EdgeInsets get verticalPaddingSmall => EdgeInsets.symmetric(vertical: 12.h);
  EdgeInsets get verticalPaddingMedium => EdgeInsets.symmetric(vertical: 16.h);
  EdgeInsets get verticalPaddingLarge => EdgeInsets.symmetric(vertical: 20.h);
  EdgeInsets get verticalPaddingXlarge => EdgeInsets.symmetric(vertical: 24.h);
  EdgeInsets get verticalPaddingXXlarrge => EdgeInsets.symmetric(vertical: 64.h);

  //zeroPadding
  EdgeInsets get zeroPadding => EdgeInsets.zero;

  //
  EdgeInsets get horizantalAndVerticalPaddingMedium => EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h);

  // all
  EdgeInsets get allPaddingBase => EdgeInsets.all(4.h);
  EdgeInsets get allPaddingSmall => EdgeInsets.all(12.h);
  EdgeInsets get allPaddingMedium => EdgeInsets.all(16.h);

  //Button

  EdgeInsets get primaryButton => EdgeInsets.symmetric(vertical: 21.h, horizontal: 32.w);
}

//Get device type
extension DeviceOSExtension on BuildContext {
  bool get isAndroidDevice => Platform.isAndroid;
  bool get isIOSDevice => Platform.isIOS;
  bool get isWindowsDevice => Platform.isWindows;
  bool get isLinuxDevice => Platform.isLinux;
  bool get isMacOSDevice => Platform.isMacOS;
}

// SizedBox
extension SizedBoxExtension on BuildContext {
  SizedBox get sizedBoxWidthBoxLow => SizedBox(width: 4.w);
  SizedBox get sizedBoxWidthBoxLow2x => SizedBox(width: 8.w);
  SizedBox get sizedBoxWidthBoxLow3x => SizedBox(width: 12.w);
  SizedBox get sizedBoxWidthBoxLow4x => SizedBox(width: 16.w);

  SizedBox get sizedBoxHeightBoxLow => SizedBox(height: 4.h);
  SizedBox get sizedBoxHeightBoxLow2x => SizedBox(height: 8.h);
  SizedBox get sizedBoxHeightBoxLow3x => SizedBox(height: 12.h);
  SizedBox get sizedBoxHeightBoxLow4x => SizedBox(height: 16.h);
}

extension RadiusExtension on BuildContext {
  BorderRadius get buttonRadius => BorderRadius.circular(8.r);
  BorderRadius get buttonRadiusx2 => BorderRadius.circular(16.r);
}

extension NavigationExtension on BuildContext {
  NavigatorState get navigation => Navigator.of(this);
}

extension RandomColorDev on BuildContext {
  Color get randomColor => Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1);
}
