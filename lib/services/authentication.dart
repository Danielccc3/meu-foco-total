import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> signUpUsers({
    required String nome,
    required String senha,
    required String email,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: senha);

      print(userCredential.user!.updateDisplayName(nome));
      print(userCredential.user!.email);
      print(userCredential.user!.uid);

      

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return "E-mail is already registered";
      }
      if (e.code == 'invalid-email') {
        return "Invalid email";
      }
      return 'error ae';
    }
  }

  Future<String?> loginUsers({required email, required senha}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: senha);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> logoff() async {
    return _firebaseAuth.signOut();
  }


}
