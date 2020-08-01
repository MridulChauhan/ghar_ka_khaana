import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghar_ka_khaana/utils/constants.dart';
import 'package:ghar_ka_khaana/values/radii.dart';

class RoundedButton extends StatelessWidget {
  final Color colour;
  final Function onPress;
  final String text;
  final double minWidth;
  const RoundedButton(
      {this.colour, @required this.onPress, this.text, this.minWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 0.5 * AppConstants.verticalPadding),
      child: Material(
        elevation: AppConstants.elevation,
        color: colour,
        borderRadius: Radii.k10pxRadius * 3,
        child: MaterialButton(
          onPressed: onPress,
          minWidth: minWidth,
          height: ScreenUtil().setHeight(42),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
