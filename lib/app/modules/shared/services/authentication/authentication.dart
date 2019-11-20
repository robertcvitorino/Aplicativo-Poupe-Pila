import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

class Authentication {
  final _firebase = FirebaseAuth.instance;
  final _google = new GoogleSignIn();

  Future<bool> createWithEmailAndPassword(String email, String password) async {
    final resultCreated = await _firebase.createUserWithEmailAndPassword(
        email: email, password: password);
    if (resultCreated?.uid != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signWithEmailAndPassword(String email, String password) async {
    try {
      
      final userAuth = _firebase.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return null;
    }
  }

  Future<bool> signWithGoogle() async {
    final googleAuthentication = await _google.signIn();
    final authenticated = await googleAuthentication.authentication;
    final usuarioAutenticado = await _firebase.signInWithGoogle(
        idToken: authenticated?.idToken,
        accessToken: authenticated?.accessToken);

    print("usuario logado !!!!!!!!!"+usuarioAutenticado.displayName);

    return usuarioAutenticado.uid != null;
  }

  singOut() {
    _firebase.signOut();
  }
}
