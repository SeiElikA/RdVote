import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rd_vote/utils/snackbar.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginClick(BuildContext context) async {
    var email = emailController.text;
    var password = passwordController.text;

    if(email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(snackbarError("Email can't empty"));
      return;
    }

    if(password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(snackbarError("Password can't empty"));
      return;
    }

    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      var userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(snackbarError(e.message.toString()));
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