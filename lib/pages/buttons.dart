import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  String buttonName;
  final VoidCallback onTap;

  double height;
  double width;
  double bottomMargin;
  double borderWidth;
  Color buttonColor;

  TextStyle textStyle = const TextStyle(
      color: const Color(0XFFFFFFFF),
      fontSize: 16.0,
      fontWeight: FontWeight.bold);

  //passing props in react style
  RoundedButton(
      {this.buttonName,
      this.onTap,
      this.height,
      this.bottomMargin,
      this.borderWidth,
      this.width,
      this.buttonColor});

  @override
  Widget build(BuildContext context) {
    if (borderWidth != 0.0)
      return (InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          margin: EdgeInsets.only(bottom: bottomMargin),
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.all(const Radius.circular(30.0)),
              border: Border.all(
                  color: const Color.fromRGBO(221, 221, 221, 1.0),
                  width: borderWidth)),
          child: Text(buttonName, style: textStyle),
        ),
      ));
    else
      return (InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          margin: EdgeInsets.only(bottom: bottomMargin),
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.all(const Radius.circular(30.0)),
          ),
          child: Text(buttonName, style: textStyle),
        ),
      ));
  }
}

class TextButton extends StatelessWidget {
  String buttonName;
  final VoidCallback onPressed;
  TextStyle textStyle,buttonTextStyle;
  //passing props in react style
  TextButton({
    this.buttonName,
    this.onPressed,
    this.buttonTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return (FlatButton(
      child:  Text(
        buttonName,
        textAlign: TextAlign.center,
        style: buttonTextStyle
      ),
      onPressed: onPressed,
    ));
  }
}