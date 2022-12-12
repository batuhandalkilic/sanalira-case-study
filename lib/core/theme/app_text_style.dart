import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum _FontWeight {
  regular(FontWeight.w400), // 400 Inter regular
  semiBold(FontWeight.w600); // 600 Inter SemiBold

  final FontWeight value;
  const _FontWeight(this.value);
}

class AppTextStyle {
  static final AppTextStyle _instance = AppTextStyle._init();
  static AppTextStyle get instance => _instance;
  AppTextStyle._init();

  final TextStyle regular10TextStyle = TextStyle(fontFamily: 'Inter', fontSize: 10.sp, fontWeight: _FontWeight.regular.value);
  final TextStyle regular12TextStyle = TextStyle(fontFamily: 'Inter', fontSize: 12.sp, fontWeight: _FontWeight.regular.value);
  final TextStyle regular16TextStyle = TextStyle(fontFamily: 'Inter', fontSize: 16.sp, fontWeight: _FontWeight.regular.value);
  final TextStyle semiBold12TextStyle = TextStyle(fontFamily: 'Inter', fontSize: 12.sp, fontWeight: _FontWeight.semiBold.value);
  final TextStyle semiBold13TextStyle = TextStyle(fontFamily: 'Inter', fontSize: 13.28.sp, fontWeight: _FontWeight.semiBold.value);
  final TextStyle semiBold16TextStyle = TextStyle(fontFamily: 'Inter', fontSize: 16.sp, fontWeight: _FontWeight.semiBold.value);
}
