import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:texpense/core/utils/app_logger.dart';

class FireAuthHelper {
  late FirebaseAuth _firebaseAuth;
  late GoogleSignIn _googleSignIn;
  static FireAuthHelper? _instance;

  FireAuthHelper._internal() {
    _firebaseAuth = FirebaseAuth.instance;
    _googleSignIn = GoogleSignIn();
  }

  static FireAuthHelper get shared {
    _instance ??= FireAuthHelper._internal();
    return _instance!;
  }

  FirebaseAuth? get fireAuth => _firebaseAuth;

  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }

  Future<UserCredential?> signIn() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential user = kDebugMode
          ? await _firebaseAuth.signInAnonymously()
          : await _firebaseAuth.signInWithCredential(credential);

      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          AppLogger.e("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          AppLogger.e("Unknown error\n$e");
      }
    }

    return null;
  }
}
