import 'package:flutter/material.dart';
import 'package:ghar_ka_khaana/values/colors.dart';

class Shadows {
  static const BoxShadow mostshadow = BoxShadow(
    color: AppColors.whiteShade2,
    offset: Offset(0, 0),
    blurRadius: 6,
  );
  static const BoxShadow secondaryShadow = BoxShadow(
    color: AppColors.whiteShade3,
    offset: Offset(0, -1),
    blurRadius: 6,
  );
}
