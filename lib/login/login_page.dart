import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:ghar_ka_khaana/login/login_button.dart';
import 'package:ghar_ka_khaana/utils/constants.dart';
import 'package:ghar_ka_khaana/values/colors.dart';
import 'package:ghar_ka_khaana/values/values.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phoneNumber = "";
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
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Mobile no.',
                style: _theme.textTheme.headline3,
              ),
            ),
            ListTile(
              leading: Text(
                '+91',
                style: _theme.textTheme.headline1,
              ),
              title: TextField(
                decoration: InputDecoration(labelText: "Phone Number"),
                keyboardType: TextInputType.phone,
                onChanged: (value) => phoneNumber = value,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Container(
              width: ScreenUtil.screenWidth,
              height: ScreenUtil().setHeight(50),
              child: RaisedButton(
                color: AppColors.buttonclr,
                disabledColor: AppColors.whiteShade2,
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Send OTP',
                ),
              ),
            ),
            Spacer(),
            Row(children: <Widget>[
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
            ]),
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
            ),
            Spacer(
              flex: 2,
            ),
            LoginButton(
              loginType: "Continue with Google",
              icon: AssetImage('assets/google.png'),
            ),
            Spacer(
              flex: 2,
            ),
            LoginButton(
              loginType: "Continue with Email",
              icon: AssetImage('assets/gmail.png'),
            ),
            Spacer(),
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
