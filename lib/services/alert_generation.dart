import 'package:flutter/material.dart';

class AlertGeneration {
  void generateAlert(var error, var context) {
    String errorMessage = showErrorMessage(error);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("OOPS !"),
          content: Text("$errorMessage"),
          actions: <Widget>[
            IconButton(
                icon: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
    );
  }

  String showErrorMessage(var error) {
    print(error.code);
    switch (error.code) {
      case "ERROR_INVALID_EMAIL":
        return "Your email address appears to be malformed.";
      case "ERROR_WEAK_PASSWORD":
        return "Password should be atLeast 6 characters";
      case "ERROR_EMAIL_ALREADY_IN_USE":
        return "Email already exists";
      case "ERROR_WRONG_PASSWORD":
        return "Incorrect password";
      case "ERROR_USER_NOT_FOUND":
        return "User with this email doesn't exist.";
      case "ERROR_USER_DISABLED":
        return "User with this email has been disabled.";
      case "ERROR_TOO_MANY_REQUESTS":
        return "Too many requests. Try again later.";
      case "ERROR_OPERATION_NOT_ALLOWED":
        return "Signing in with Email and Password is not enabled.";
      default:
        return "An undefined Error happened.";
    }
  }
}
