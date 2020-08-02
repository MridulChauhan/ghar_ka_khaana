import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:ghar_ka_khaana/components/boxlogin_textfield.dart';
import 'package:ghar_ka_khaana/components/wide_button.dart';
import 'package:ghar_ka_khaana/screens/login/login_button.dart';
import 'package:ghar_ka_khaana/screens/login/otp_screen.dart';
import 'package:ghar_ka_khaana/services/sign_in.dart';
import 'package:ghar_ka_khaana/utils/constants.dart';
import 'package:ghar_ka_khaana/utils/routes.dart';
import 'package:ghar_ka_khaana/values/colors.dart';
import 'package:ghar_ka_khaana/values/values.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phoneNumber;
  TextEditingController _phoneController = TextEditingController();

  bool isValidEntry() {
    if (_phoneController.text.length == 10)
      return true;
    else
      return false;
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.all(2 * AppConstants.verticalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ghar Ka Khaana',
              style: GoogleFonts.fredokaOne(
                textStyle: _theme.textTheme.headline1.copyWith(
                  fontSize: ScreenUtil().setSp(35),
                ),
              ),
            ),
            Spacer(
              flex: 10,
            ),
            Text(
              'Get Started',
              style: _theme.textTheme.headline1,
            ),
            Spacer(),
            Text(
              'Enter your phone number and we will send an OTP to continue',
              style: _theme.textTheme.headline3,
              textAlign: TextAlign.center,
            ),
            Spacer(
              flex: 10,
            ),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     'Mobile no.',
            //     style: _theme.textTheme.headline3,
            //   ),
            // ),
            BoxLoginTextfield(
              controller: _phoneController,
              inputType: TextInputType.number,
              autoFocus: false,
              fieldHeight: ScreenUtil().setHeight(50.0),
              leading: Text(
                '+91',
                style: _theme.textTheme.headline2,
              ),
              rejectColor: Colors.red,
              acceptedColor: Colors.green,
              isDataValid: isValidEntry() ? true : false,
              maxLength: 10,
              onChanged: (value) {
                setState(() {
                  phoneNumber = value;
                });
              },
              title: "Mobile No.",
            ),
            Spacer(
              flex: 2,
            ),
            WideButton(
              text: "Send OTP",
              isEnabled: isValidEntry(),
              onPress: () => isValidEntry()
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OTPScreen(
                          phoneNumber: phoneNumber,
                        ),
                      ),
                    )
                  : null,
            ),
            Spacer(),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(
                          left: 0.5 * AppConstants.horizontalPadding,
                          right: 0.75 * AppConstants.horizontalPadding),
                      child: Divider(
                        color: AppColors.dividerclr,
                        height: ScreenUtil().setHeight(50),
                      )),
                ),
                Text("OR"),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(
                          left: 0.75 * AppConstants.horizontalPadding,
                          right: 0.5 * AppConstants.horizontalPadding),
                      child: Divider(
                        color: AppColors.dividerclr,
                        height: ScreenUtil().setHeight(50),
                      )),
                ),
              ],
            ),
            // Row(
            //   children: <Widget>[
            //     Text(
            //       '+91',
            //       style: _theme.textTheme.headline2,
            //     ),
            //     Container(
            //       child: Text('987546623612'),
            //     )
            //   ],
            // ),
            Spacer(
              flex: 2,
            ),
            LoginButton(
              loginType: "Continue with Facebook",
              icon: AssetImage('assets/facebook.png'),
              onPress: () => print('Facebook'),
            ),
            Spacer(
              flex: 2,
            ),
            LoginButton(
              loginType: "Continue with Google",
              icon: AssetImage('assets/google.png'),
              onPress: () async {
                var result = await SignInMethods().signInWithGoogle();
                print(result);
                if (result == "success")
                  Navigator.pushNamed(context, AppRoutes.homePage);
                else
                  print("failed");
              },
            ),
            Spacer(
              flex: 2,
            ),
            LoginButton(
              loginType: "Continue with Email",
              icon: AssetImage('assets/gmail.png'),
              onPress: () =>
                  Navigator.pushNamed(context, AppRoutes.emailsignUpScreen),
            ),
            Spacer(
              flex: 3,
            ),
            Text(
              'By continuing you agree to our \n',
              textAlign: TextAlign.center,
              style: _theme.textTheme.headline6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: "Terms of Service",
                    style: _theme.textTheme.headline6
                        .copyWith(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => print("Terms of Service"),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Privacy Policy",
                    style: _theme.textTheme.headline6
                        .copyWith(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => print("Privacy Policy"),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Content Policy",
                    style: _theme.textTheme.headline6
                        .copyWith(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => print("Content Policy"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
