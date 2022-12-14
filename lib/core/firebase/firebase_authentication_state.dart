// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanalira/core/firebase/firebase_auth.dart';

final userChangesProvider = Provider<bool?>((ref) {
  bool? isValue = false;
  final stream = ref.watch(authStateChangesProvider.stream);
  stream.listen((value) {
    if (value == null) {
      print('Kullanıcı Giriş Yapmadı!');
    } else {
      print('Kullanıcı(${value.email}) Giriş Yaptı!');
      print(value.emailVerified);
      print(value.email);
      print(value.uid);
      print(value.providerData[0].providerId);
      print(ref.watch(firebaseAuthProvider).currentUser?.email);

      isValue = true;
    }
  });
  return isValue;
});

final authStateChangesProvider = StreamProvider<User?>((ref) => ref.watch(firebaseAuthProvider).userChanges());
