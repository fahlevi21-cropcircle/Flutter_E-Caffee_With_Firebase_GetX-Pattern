import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_caffee/app/data/providers/firebase/authentication.dart';

class AuthenticationRepository {
  final FirebaseAuthenticationApi api;

  AuthenticationRepository(this.api);

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async =>
      await api.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

  Future<UserCredential> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async =>
      await api.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
}
