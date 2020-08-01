import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:ghar_ka_khaana/utils/constants.dart';
import 'package:ghar_ka_khaana/values/colors.dart';
import 'package:ghar_ka_khaana/values/radii.dart';

class BoxLoginTextfield extends StatefulWidget {
  final String title;
  final double fieldHeight;
  final TextEditingController controller;
  final bool isDataValid;
  final Widget leading;
  final bool autoFocus;
  final TextInputType inputType;
  final void Function(String) onChanged;
  final Color acceptedColor;
  final Color rejectColor;
  final double horizontalMargin;
  final double verticalMargin;
  final double hPadding;
  final double vPadding;
  final int maxLength;

  BoxLoginTextfield({
    this.autoFocus = false,
    this.acceptedColor,
    @required this.controller,
    this.fieldHeight,
    this.maxLength,
    this.isDataValid = false,
    this.horizontalMargin = AppConstants.horizontalPadding,
    this.hPadding = 0.4 * AppConstants.horizontalPadding,
    this.vPadding = 0.5 * AppConstants.verticalPadding,
    this.verticalMargin = AppConstants.verticalPadding,
    this.inputType = TextInputType.text,
    this.leading,
    this.onChanged,
    this.rejectColor,
    @required this.title,
  }) : super();
  @override
  _BoxLoginTextfieldState createState() => _BoxLoginTextfieldState();
}

class _BoxLoginTextfieldState extends State<BoxLoginTextfield>
    with SingleTickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  AnimationController _controller;
  bool onBorder = false;

  int length = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    // _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _controller.dispose();
    // _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  // void _handleFocusChange() async {
  //   if (_focusNode.hasFocus) {
  //     _controller.forward().then((value) => setState(() {
  //           onBorder = true;
  //         }));
  //   }

  //   if (!_focusNode.hasFocus) {
  //     if (widget.controller.text == "") {
  //       setState(() {
  //         onBorder = false;
  //       });
  //       _controller.reverse();
  //     } else {
  //       _controller.forward().then((value) => setState(() {
  //             onBorder = true;
  //           }));
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      width: double.maxFinite,
      height: this.widget.fieldHeight,
      margin: EdgeInsets.symmetric(
          vertical: this.widget.verticalMargin,
          horizontal: this.widget.horizontalMargin),
      decoration: BoxDecoration(
          borderRadius: Radii.k10pxRadius,
          border: Border.all(
              width: 1.5,
              color: this.widget.isDataValid
                  ? this.widget.acceptedColor
                  : this.widget.rejectColor)),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: this.widget.hPadding),
                child: this.widget.leading,
              )),
          SizedBox(
            width: ScreenUtil().setWidth(10),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: AppConstants.horizontalPadding,
                  left: 2.5 * AppConstants.horizontalPadding),
              child: TextField(
                autofocus: this.widget.autoFocus,
                focusNode: _focusNode,
                controller: widget.controller,
                onChanged: (val) {
                  this.widget.onChanged(val);
                  setState(() {
                    length = this.widget.controller.text.length;
                  });
                },
                maxLength: this.widget.maxLength,
                cursorWidth: 2.0,
                selectionHeightStyle: BoxHeightStyle.max,
                textAlignVertical: TextAlignVertical.center,
                textCapitalization: TextCapitalization.sentences,
                keyboardType: this.widget.inputType ?? TextInputType.text,
                style: _theme.textTheme.headline2,
                decoration: InputDecoration(
                  counterText: "",
                  //suffixIconConstraints: BoxConstraints.tight(Size(5.0, 5.0)),
                  //suffixText: length.toString() + "/${this.widget.maxLength}",
                  hintText: !_focusNode.hasFocus ? this.widget.title : '',
                  hintStyle: _theme.textTheme.headline3
                      .copyWith(color: AppColors.sctxt),
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          // onBorder
          //     ?
          Align(
            alignment: Alignment.topLeft.add(Alignment(0.1, -0.4)),
            child: Container(
              height: ScreenUtil().setHeight(10),
              color: AppColors.white,
              child: Text(
                this.widget.title,
                style: _theme.textTheme.headline6.copyWith(
                    color: this.widget.isDataValid
                        ? this.widget.acceptedColor
                        : this.widget.rejectColor),
              ),
            ),
          ),
          // : Container(),
          // Align(
          //   alignment: Alignment.centerLeft,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(
          //         horizontal: 2 * SupplysConstants.horizontalPadding),
          //     child: AnimatedBuilder(
          //       animation: _controller,
          //       child: Text(
          //         this.widget.title,
          //         style: _theme.textTheme.headline3
          //             .copyWith(color: AppColors.splyscbk30),
          //       ),
          //       builder: (context, child) {
          //         double scale = 1.0 - _controller.value;
          //         return Transform(
          //           transform: Matrix4.identity()..scale(scale),
          //           child: child,
          //         );
          //       },
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
