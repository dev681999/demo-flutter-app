import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  IconData icon;
  String hintText;
  TextInputType textInputType;
  Color textFieldColor, iconColor;
  bool obscureText;
  double bottomMargin;
  TextStyle textStyle, hintStyle;
  var validateFunction;
  var onSaved;
  Key key;

  //passing props in the Constructor.
  //Java like style
  InputField(
      {this.key,
      this.hintText,
      this.obscureText,
      this.textInputType,
      this.textFieldColor,
      this.icon,
      this.iconColor,
      this.bottomMargin,
      this.textStyle,
      this.validateFunction,
      this.onSaved,
      this.hintStyle});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Container(
        margin: EdgeInsets.only(bottom: bottomMargin),
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              color: textFieldColor),
          child: TextFormField(
            style: textStyle,
            key: key,
            obscureText: obscureText,
            keyboardType: textInputType,
            validator: validateFunction,
            onSaved: onSaved,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintStyle,
              icon: Icon(
                icon,
                color: iconColor,
              ),
            ),
          ),
        )));
  }
}