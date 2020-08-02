import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:ghar_ka_khaana/components/login_textfield.dart';
import 'package:ghar_ka_khaana/components/wide_button.dart';
import 'package:ghar_ka_khaana/services/sign_in.dart';
import 'package:ghar_ka_khaana/utils/constants.dart';
import 'package:ghar_ka_khaana/utils/routes.dart';
import 'package:ghar_ka_khaana/values/colors.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _email;
  String _password;
  bool isLoading = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isValidEntry() {
    if (_email != null &&
        _password != null &&
        _email.contains("@") &&
        _password.length > 6)
      return true;
    else
      return false;
  }

  void registerUser() async {
    setState(() => isLoading = !isLoading);
    await SignInMethods().registerUser(context, _email, _password);
    setState(() => isLoading = !isLoading);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.scbkd1,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Sign Up",
          style: _theme.textTheme.headline1,
        ),
        backgroundColor: AppColors.scbkd1,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 0.8 * AppConstants.verticalPadding,
            horizontal: 1.5 * AppConstants.horizontalPadding),
        child: Column(
          children: <Widget>[
            LoginTextField(
              labeltext: "Email",
              //autofocus: true,
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            LoginTextField(
              labeltext: "Password",
              obscuretext: true,
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 400),
              switchInCurve: Curves.easeInCubic,
              switchOutCurve: Curves.easeInCubic,
              transitionBuilder: (Widget child, Animation<double> animation) =>
                  ScaleTransition(child: child, scale: animation),
              child: isLoading
                  ? CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.buttonclr),
                      strokeWidth: 5,
                    )
                  : WideButton(
                      text: "Register",
                      isEnabled: isValidEntry(),
                      onPress: () async =>
                          isValidEntry() ? registerUser() : null,
                    ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.emailLoginPage),
              child: Container(
                height: ScreenUtil().setHeight(30),
                child: Text(
                  "Already have an account ? Login.",
                  style: _theme.textTheme.headline6.copyWith(
                    color: AppColors.buttonclr,
                    fontSize: ScreenUtil().setSp(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
