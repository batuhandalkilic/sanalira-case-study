import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/firebase/firebase_authentication_state.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final isSignInUser = ref.watch(authStateChangesProvider);
    return Container(
      color: Colors.pink,
      child: Center(
        child: Text("${isSignInUser.value!.email} kullanıcısı email doğrulaması : ${isSignInUser.value!.emailVerified}"),
      ),
    );
  }
}
