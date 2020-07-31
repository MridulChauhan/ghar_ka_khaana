import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:ghar_ka_khaana/utils/constants.dart';
import 'package:ghar_ka_khaana/values/values.dart';

class LoginButton extends StatelessWidget {
  final String loginType;
  final AssetImage icon;

  LoginButton({@required this.loginType, @required this.icon});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return GestureDetector(
      onTap: () => print('Sign In with google'),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: Radii.k10pxRadius,
            boxShadow: [Shadows.mostshadow]),
        width: ScreenUtil.screenWidth,
        height: ScreenUtil().setHeight(50),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 0.4 * AppConstants.horizontalPadding),
          child: Row(
            children: <Widget>[
              Image(
                image: icon,
                height: ScreenUtil().setHeight(35),
              ),
              SizedBox(width: ScreenUtil().setWidth(13)),
              Text('$loginType',
                  style: _theme.textTheme.headline1
                      .copyWith(fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ),
    );
  }
}
