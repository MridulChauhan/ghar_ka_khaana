import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:ghar_ka_khaana/components/boxlogin_textfield.dart';
import 'package:ghar_ka_khaana/services/sign_in.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BoxLoginTextfield(
            controller: controller,
            autoFocus: true,
            isDataValid: true,
            fieldHeight: ScreenUtil().setHeight(50.0),
            leading: Icon(Icons.add),
            acceptedColor: Colors.green,
            rejectColor: Colors.red,
            //inputType: String,
            //maxLength: getMax(),
            //controller: ,
            //onChanged: (value) => ,
            title: "Email",
          ),
          Text(
            'Home Screen',
            style: _theme.textTheme.headline1,
          ),
          SizedBox(height: 50),
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
