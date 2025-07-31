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
        throw CustomException(message: 'لا يمكن انشاء الحساب');
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'البريد الالكتروني مستخدم بالفعل');
      } else {
        throw CustomException(message: e.message ?? 'FirebaseAuth error');
      }

    } catch (e) {
      throw CustomException(message: "هناك خطاء غير متوقع يرجى المحاولة في وقت لاحق");
    }
  }
}