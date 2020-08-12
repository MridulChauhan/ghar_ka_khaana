import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ghar_ka_khaana/services/alert_generation.dart';
import 'package:ghar_ka_khaana/utils/routes.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

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

  Future<String> signInWithFacebook() async {
    try {
      // final facebookLogin = new FacebookLogin();
      // final result = await facebookLogin.logIn(['email']);
      // // final result = await facebookLogin.logInWithReadPermissions(['email']); --> Versions bellow 3.0
      // switch (result.status) {
      //   case FacebookLoginStatus.loggedIn:
      //     print(result.accessToken.token);
      //     break;
      //   case FacebookLoginStatus.cancelledByUser:
      //     print('CANCELED BY USER');
      //     break;
      //   case FacebookLoginStatus.error:
      //     print(result.errorMessage);
      //     break;
      // }

      final facebookLogin = FacebookLogin();
      final result = await facebookLogin.logIn(['email']);
      final token = result.accessToken.token;
      Response graphResponse = await Dio().get(
          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token');
      final profile = jsonDecode(graphResponse.toString());
      print(profile);
      print(graphResponse);
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          return "success";
          break;
        case FacebookLoginStatus.cancelledByUser:
          return "Cancelled";
          break;
        case FacebookLoginStatus.error:
          print(result.errorMessage);
          break;
      }
      return "failed attempt";
    } catch (e) {
      return "failed attempt";
    }
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
    print("User Sign Out");
    await FacebookLogin().logOut();
    FirebaseAuth.instance.signOut();
    //AuthService().signOut();
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
