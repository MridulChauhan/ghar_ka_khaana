import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ghar_ka_khaana/components/components.dart';
import 'package:ghar_ka_khaana/services/sign_in.dart';

class HomeScreen extends StatefulWidget {
  final FirebaseUser user;
  HomeScreen({this.user});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = new TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedSwitcher(
              duration: Duration(milliseconds: 400),
              switchInCurve: Curves.easeInCubic,
              child: isLoading
                  ? CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : RoundedButton(
                      text: "Login",
                      onPress: () => setState(() => isLoading = !isLoading),
                      colour: Colors.red,
                    )),
          Text(
            'Home Screen',
            style: _theme.textTheme.headline1,
          ),
          SizedBox(height: 50),
          Text("Welcome ${widget.user}"),
          FlatButton(
            onPressed: () {
              SignInMethods().signOutGoogle();
              Navigator.pop(context);
            },
            child: Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
