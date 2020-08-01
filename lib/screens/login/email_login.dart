import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:ghar_ka_khaana/components/boxlogin_textfield.dart';
import 'package:ghar_ka_khaana/components/components.dart';
import 'package:ghar_ka_khaana/utils/utils.dart';
import 'package:ghar_ka_khaana/services/sign_in.dart';
import 'package:ghar_ka_khaana/values/values.dart';

class EmailLoginScreen extends StatefulWidget {
  @override
  _EmailLoginScreenState createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  String email;
  String password;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _boxController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _boxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: AppDecoration.backgroundGradient,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: AppDecoration.cardBoardDecoration,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 1.5 * AppConstants.horizontalPadding),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: ScreenUtil().setHeight(30)),
                          Container(
                            decoration: AppDecoration.containerdcrt,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 0.5 * AppConstants.cnstPadding),
                                  child: Text(
                                    'Try typing something !',
                                    style: _theme.textTheme.headline1,
                                  ),
                                ),
                                // LoginTextField(
                                //   textController: _emailController,
                                //   isEditEnabled: true,
                                //   onChanged: (value) =>
                                //       setState(() => email = value),
                                // ),
                                // LoginTextField(
                                //   textController: _passwordController,
                                //   isEditEnabled: true,
                                //   onChanged: (value) =>
                                //       setState(() => password = value),
                                // ),

                                SizedBox(height: ScreenUtil().setHeight(10)),
                                TextField(
                                  onChanged: (newValue) {
                                    email = newValue;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      hintText: "Enter your Email id",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                                Divider(thickness: 1, color: Colors.grey[200]),
                                TextField(
                                  onChanged: (newValue) {
                                    password = newValue;
                                  },
                                  textAlign: TextAlign.center,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "Enter your Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(20)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedButton(
                                minWidth: ScreenUtil().setWidth(130),
                                colour: Colors.lightBlue[900],
                                text: 'Login',
                                onPress: () async {
                                  if (email != null && password != null) {
                                    CircularProgressIndicator();
                                    await SignInMethods()
                                        .loginUser(context, email, password);
                                  }
                                },
                              ),
                              SizedBox(width: ScreenUtil().setWidth(10)),
                              RoundedButton(
                                minWidth: ScreenUtil().setWidth(130),
                                colour: Colors.lightBlue[900],
                                onPress: () async {
                                  if (email != null && password != null) {
                                    CircularProgressIndicator();
                                    await SignInMethods()
                                        .registerUser(context, email, password);
                                  }
                                },
                                text: 'Register',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
