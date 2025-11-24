import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // success
    } on FirebaseAuthException catch (e) {
      return errorHandler(e.code);
    } catch (e) {
      return "حدث خطأ غير متوقع";
    }
  }

  Future<String?> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // success
    } on FirebaseAuthException catch (e) {
      return errorHandler(e.code);
    } catch (e) {
      return "حدث خطأ غير متوقع";
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  String errorHandler(String code) {
    switch (code) {
      case "invalid-email":
        return "صيغة البريد الإلكتروني غير صحيحة";

      case "user-disabled":
        return "هذا الحساب معطّل ولا يمكن استخدامه";

      case "user-not-found":
        return "هذا البريد غير مسجل";

      case "wrong-password":
        return "كلمة المرور غير صحيحة";

      case "too-many-requests":
        return "محاولات كثيرة! الرجاء المحاولة لاحقًا";

    // إنشاء حساب
      case "email-already-in-use":
        return "هذا البريد مستخدم مسبقًا";

      case "weak-password":
        return "كلمة المرور ضعيفة جدًا";

      case "operation-not-allowed":
        return "إنشاء الحساب غير مفعّل لهذا النوع من تسجيل الدخول";

    // أخطاء عامة
      case "network-request-failed":
        return "تحقق من اتصالك بالإنترنت";

      case "internal-error":
        return "خطأ داخلي، الرجاء المحاولة لاحقًا";

      default:
        return "معلومات تسجيل الدخول غير صحيحة";
    }
  }
}
