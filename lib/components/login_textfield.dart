import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String labeltext;
  final bool autofocus;
  final bool obscuretext;
  final Function onChanged;

  LoginTextField(
      {this.labeltext,
      this.autofocus = false,
      this.obscuretext = false,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return TextField(
      autofocus: autofocus,
      obscureText: obscuretext,
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        labelText: labeltext,
        labelStyle: _theme.textTheme.headline2
            .copyWith(fontSize: 20, fontWeight: FontWeight.w300),
        alignLabelWithHint: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange[900]),
        ),
      ),
    );
  }
}
