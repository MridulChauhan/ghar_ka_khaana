import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghar_ka_khaana/utils/constants.dart';
import 'package:ghar_ka_khaana/values/colors.dart';

class LoginTextField extends StatefulWidget {
  final Color bgColor;
  final String hintText;
  final TextEditingController textController;
  final FocusNode focusNode;
  final bool isEditEnabled;
  final String leading;
  final bool autoFocus;
  final VoidCallback onTapCallBack;
  final TextInputType inputType;
  final double fieldHeight;
  final double horizontalPadding;
  final TextStyle hintStyle;
  final Function onChanged;

  LoginTextField(
      {Key key,
      this.autoFocus = false,
      this.bgColor = AppColors.white,
      this.hintText,
      this.onChanged,
      this.hintStyle,
      this.leading,
      this.inputType,
      this.fieldHeight = 50.0,
      this.horizontalPadding = 1.5 * AppConstants.horizontalPadding,
      @required this.textController,
      this.focusNode,
      @required this.isEditEnabled,
      this.onTapCallBack})
      : super(key: key);

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  final padding30 = EdgeInsets.only(left: 2.0);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: widget.fieldHeight,
      margin: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
      decoration: BoxDecoration(
          color: widget.bgColor, borderRadius: BorderRadius.circular(2.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          widget.leading != '' && widget.leading != null
              ? Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () => widget.onTapCallBack,
                    child: Center(
                      child: Text(
                        widget.leading,
                        style: _theme.textTheme.headline2,
                      ),
                    ),
                  ),
                )
              : Container(),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextField(
                  autofocus: widget.autoFocus,
                  onChanged: widget.onChanged,
                  cursorColor: AppColors.blueShade1,
                  controller: widget.textController,
                  focusNode: widget.focusNode,
                  keyboardType: widget.inputType,
                  style: _theme.textTheme.headline2
                      .copyWith(fontWeight: FontWeight.w400),
                  textAlignVertical: TextAlignVertical.center,
                  textCapitalization: TextCapitalization.sentences,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      isDense:
                          widget.fieldHeight == ScreenUtil().setHeight(50.0)
                              ? false
                              : true,
                      hintText: widget.hintText,
                      hintStyle: widget.hintStyle),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
