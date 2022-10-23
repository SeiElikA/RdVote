import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginClick(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    var email = emailController.text;
    var password = passwordController.text;

    try {
      var userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> googleSignIn(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    var googleSignIn = GoogleSignIn();
    var googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      var googleSignInAuthentication = await googleSignInAccount.authentication;
      var credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken
      );
      try {
        final UserCredential userCredential = await auth.signInWithCredential(credential);
        userCredential.user;
      } on FirebaseAuthException catch (e) {
        print(e.message);
      }
    }
  }
}