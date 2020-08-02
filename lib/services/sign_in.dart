import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ghar_ka_khaana/services/alert_generation.dart';
import 'package:ghar_ka_khaana/utils/routes.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<String> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final AuthResult authResult =
          await _auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);

      return 'success';
    } catch (e) {
      return 'failed';
    }
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
    print("User Sign Out");
  }

  Future<String> registerUser(
      var context, String email, String password) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        Navigator.pushNamed(context, AppRoutes.homePage);
      }
    } catch (error) {
      AlertGeneration().generateAlert(error, context);
    }
    return 'User Registered : $email';
  }

  Future<String> loginUser(var context, String email, String password) async {
    try {
      AuthResult regUser = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (regUser != null) {
        Navigator.pushNamed(context, AppRoutes.homePage);
      }
    } catch (error) {
      AlertGeneration().generateAlert(error, context);
    }
    return 'User Logged In : $email';
  }
}
