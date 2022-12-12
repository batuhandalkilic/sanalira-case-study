import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/extension/build_extension.dart';
import '../../core/extension/string_extension.dart';
import '../../core/theme/app_color.dart';
import '../../core/theme/app_text_style.dart';

class AuthenticationPage extends ConsumerStatefulWidget {
  const AuthenticationPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends ConsumerState<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: 
      ),
    );
  }
}
