import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'authentication.dart';

abstract class AuthenticationViewModel extends ConsumerState<AuthenticationPage> {
  String? ad;
  String? soyadi;
  String? sifre;
  String? email;
  String? telNum;
  bool? verify;
  final formKey = GlobalKey<FormState>();

  final isVisibilityChangeProvider = StateProvider<bool>((ref) {
    return true;
  });
  final isCheckChangeProvider = StateProvider<bool>((ref) {
    return false;
  });
}
