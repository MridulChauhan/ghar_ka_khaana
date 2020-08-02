import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:ghar_ka_khaana/utils/constants.dart';
import 'package:ghar_ka_khaana/utils/routes.dart';
import 'package:ghar_ka_khaana/values/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 640, width: 360);
    final _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.scbkd1,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(150),
            width: ScreenUtil().setWidth(265),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/google.png'),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: AppConstants.cnstPadding),
              child: Text(
                'Welcome to Ghar Ka Khaana',
                style: GoogleFonts.fredokaOne(
                  textStyle: _theme.textTheme.headline1.copyWith(
                    fontSize: ScreenUtil().setSp(25),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: AppConstants.cnstPadding),
              child: Text(
                'Delicious Indian homemade delight delivered right to you !',
                style: _theme.textTheme.headline2
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 3 * AppConstants.cnstPadding),
              child: Text(
                'SELECT WHO YOU ARE',
                style: _theme.textTheme.headline1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3 * AppConstants.cnstPadding),
            child: Material(
              color: Colors.blueAccent,
              elevation: 4.0,
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                width: ScreenUtil().setWidth(215),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Material(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(30.0),
                      child: MaterialButton(
                        minWidth: ScreenUtil().setWidth(115),
                        onPressed: () =>
                            Navigator.pushNamed(context, AppRoutes.loginPage),
                        height: ScreenUtil().setHeight(10.0),
                        child: Text(
                          'Customer',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(30.0),
                      child: MaterialButton(
                        minWidth: ScreenUtil().setWidth(100),
                        onPressed: () =>
                            Navigator.pushNamed(context, AppRoutes.loginPage),
                        height: ScreenUtil().setHeight(10.0),
                        child: Text(
                          'Provider',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         FlatButton(
//             color: AppColors.whiteShade1,
//             onPressed: () => Navigator.pushNamed(context, AppRoutes.loginPage),
//             child: Text('Customer')),
//         SizedBox(
//           height: ScreenUtil().setHeight(20),
//         ),
//         FlatButton(
//             color: AppColors.whiteShade1,
//             onPressed: () => Navigator.pushNamed(context, AppRoutes.loginPage),
//             child: Text('Chef'))
//       ],
//     );
