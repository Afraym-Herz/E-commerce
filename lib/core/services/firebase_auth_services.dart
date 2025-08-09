import 'dart:developer';

import 'package:e_commerce/core/errors/custom_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        return credential.user!;
      } else {
        throw CustomException(message: 'لا يمكن انشاء الحساب');
      }
    } on FirebaseAuthException catch (e) {
      log(
        'exist exception in firebase auth services with createUserWithEmailAndPassword ${e.message}',
      );

      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'البريد الالكتروني مستخدم بالفعل');
      } else {
        throw CustomException(message: e.message ?? 'FirebaseAuth error');
      }
    } catch (e) {
      throw CustomException(
        message: "هناك خطاء غير متوقع يرجى المحاولة في وقت لاحق",
      );
    }
  }

  Future<User> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        return credential.user!;
      } else {
        throw CustomException(message: 'لا يمكن تسجيل الدخول');
      }
    } on FirebaseAuthException catch (e) {
      log(
        'exist exception in firebase auth services with signInWithEmailAndPassword ${e.message}',
      );
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'لا يمكن تسجيل الدخول');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'كلمة المرور غير صحيحة');
      } else {
        throw CustomException(message: e.message ?? 'FirebaseAuth error');
      }
    } catch (e) {
      throw CustomException(
        message: "هناك خطاء غير متوقع يرجى المحاولة في وقت لاحق",
      );
    }
  }



  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }


Future<User> signInWithFacebook() async {

  final LoginResult loginResult = await FacebookAuth.instance.login();
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
}

Future deleteUser() async {
  await FirebaseAuth.instance.currentUser!.delete();
}

bool isUserLoggedIn() {
  return FirebaseAuth.instance.currentUser != null;
}

}
