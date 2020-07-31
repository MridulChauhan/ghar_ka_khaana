import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:ghar_ka_khaana/utils/routes.dart';
import 'package:ghar_ka_khaana/values/colors.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 640, width: 360);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
            color: AppColors.whiteShade1,
            onPressed: () => Navigator.pushNamed(context, AppRoutes.loginPage),
            child: Text('Customer')),
        SizedBox(
          height: ScreenUtil().setHeight(20),
        ),
        FlatButton(
            color: AppColors.whiteShade1,
            onPressed: () => Navigator.pushNamed(context, AppRoutes.loginPage),
            child: Text('Chef'))
      ],
    );
  }
}
