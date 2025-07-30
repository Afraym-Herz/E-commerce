import 'package:e_commerce/core/errors/custom_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        return credential.user!;
      } else {
        throw CustomException(message: 'User could not be created.');
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'The account already exists for that email.');
      } else {
        throw CustomException(message: e.message ?? 'FirebaseAuth error');
      }

    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}