import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:ghar_ka_khaana/values/values.dart';

class WideButton extends StatelessWidget {
  final String text;
  final Function onPress;
  final bool isEnabled;
  WideButton(
      {@required this.onPress, @required this.text, this.isEnabled = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil().setHeight(50),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: Radii.k10pxRadius),
        color: isEnabled ? AppColors.buttonclr : AppColors.whiteShade2,
        disabledColor: AppColors.whiteShade2,
        //disabledTextColor: Colors.white,
        onPressed: onPress,
        child: Text(
          '$text',
        ),
      ),
    );
  }
}
