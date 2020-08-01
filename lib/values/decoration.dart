import 'package:flutter/material.dart';
import 'package:ghar_ka_khaana/values/values.dart';

class AppDecoration {
  static BoxDecoration cardBoardDecoration = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.only(
      topRight: Radii.k50pxRadius,
      topLeft: Radii.k50pxRadius,
    ),
  );

  static BoxDecoration backgroundGradient = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      colors: [
        Colors.orange[900],
        Colors.orange[600],
        Colors.orange[200],
      ],
    ),
  );

  static BoxDecoration containerdcrt = BoxDecoration(
    color: AppColors.white,
    borderRadius: Radii.k10pxRadius,
    boxShadow: [
      BoxShadow(
          color: Color.fromRGBO(225, 95, 27, .3),
          blurRadius: 20,
          offset: Offset(0, 10)),
    ],
  );
}
