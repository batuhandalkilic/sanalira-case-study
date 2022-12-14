import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../pages/authentication/model.dart';
import 'firebase_auth.dart';

final fireBaseAuthProvider = StateNotifierProvider<FireBaseAuthNotifier, bool>((ref) {
  return FireBaseAuthNotifier(ref: ref);
});

class FireBaseAuthNotifier extends StateNotifier<bool> {
  final StateNotifierProviderRef ref;
  FireBaseAuthNotifier({required this.ref}) : super(true);

  Future<void> createEmailAndPassword(UserEmailAndPassword userEmailAndPassword) async {
    final auth = ref.watch(firebaseAuthProvider);
    UserCredential credential = await auth.createUserWithEmailAndPassword(email: userEmailAndPassword.email, password: userEmailAndPassword.password);
    var myUser = credential.user;

    if (!(myUser!.emailVerified)) {
      await myUser.sendEmailVerification();
    }
  }

  Future<void> signInEmailAndPassword(UserEmailAndPassword userEmailAndPassword) async {
    final auth = ref.watch(firebaseAuthProvider);
    await auth.signInWithEmailAndPassword(email: userEmailAndPassword.email, password: userEmailAndPassword.password);
  }

  Future<void> googleSignIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    final auth = ref.watch(firebaseAuthProvider);
    if (auth.currentUser?.providerData[0].providerId == 'google.com') {
      await GoogleSignIn().disconnect();
    } else {
      await auth.signOut();
    }
    await auth.signOut();
  }

  Future<void> deleteAccount() async {
    final auth = ref.read(firebaseAuthProvider);
    final user = auth.currentUser;
    await user?.delete();
  }
}
