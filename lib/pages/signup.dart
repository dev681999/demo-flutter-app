import 'package:demo_app/pages/buttons.dart';
import 'package:demo_app/pages/inputField.dart';
import 'package:demo_app/pages/theme.dart';
import 'package:demo_app/pages/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextStyle headingStyle = TextStyle(
  color: Colors.white,
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

DecorationImage backgroundImage = DecorationImage(
  image: ExactAssetImage('assets/signup-screen-background.png'),
  fit: BoxFit.cover,
);

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autovalidate = false;
  Validations _validations = Validations();
  String email, password, name, address, phoneNumber;

  _onPressed() {
    print("button clicked");
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  void _handleSubmitted() async {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    //print(context.widget.toString());
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(image: backgroundImage),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    height: screenSize.height / 2 + 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "CREATE ACCOUNT",
                          textAlign: TextAlign.center,
                          style: headingStyle,
                        )
                      ],
                    )),
                Column(
                  children: <Widget>[
                    Form(
                        key: _formKey,
                        autovalidate: _autovalidate,
                        //onWillPop: _warnUserAboutInvalidData,
                        child: Column(
                          children: <Widget>[
                            InputField(
                              hintText: "Email",
                              obscureText: false,
                              textInputType: TextInputType.emailAddress,
                              textStyle: textStyle,
                              textFieldColor: textFieldColor,
                              icon: Icons.email,
                              iconColor: Colors.white,
                              bottomMargin: 20.0,
                              validateFunction: _validations.validateEmail,
                              onSaved: (String text) {
                                email = text;
                              },
                            ),
                            InputField(
                                hintText: "Name",
                                obscureText: false,
                                textInputType: TextInputType.text,
                                textStyle: textStyle,
                                textFieldColor: textFieldColor,
                                icon: Icons.person_outline,
                                iconColor: Colors.white,
                                bottomMargin: 20.0,
                                // validateFunction: _validations.validateName,
                                onSaved: (String text) {
                                  name = text;
                                }),
                            InputField(
                                hintText: "Address",
                                obscureText: false,
                                textInputType: TextInputType.text,
                                textStyle: textStyle,
                                textFieldColor: textFieldColor,
                                icon: Icons.location_on,
                                iconColor: Colors.white,
                                bottomMargin: 20.0,
                                // validateFunction: _validations.validateEmail,
                                onSaved: (String text) {
                                  address = text;
                                }),
                            InputField(
                                hintText: "Phone Number",
                                obscureText: false,
                                textInputType: TextInputType.phone,
                                textStyle: textStyle,
                                textFieldColor: textFieldColor,
                                icon: Icons.call,
                                iconColor: Colors.white,
                                bottomMargin: 20.0,
                                // validateFunction: _validations.validateEmail,
                                onSaved: (String text) {
                                  phoneNumber = text;
                                }),
                            InputField(
                                hintText: "Password",
                                obscureText: true,
                                textInputType: TextInputType.text,
                                textStyle: textStyle,
                                textFieldColor: textFieldColor,
                                icon: Icons.lock_open,
                                iconColor: Colors.white,
                                bottomMargin: 40.0,
                                validateFunction: _validations.validatePassword,
                                onSaved: (String text) {
                                  password = text;
                                }),
                            RoundedButton(
                              buttonName: "Continue",
                              onTap: _handleSubmitted,
                              width: screenSize.width,
                              height: 50.0,
                              bottomMargin: 10.0,
                              borderWidth: 1.0,
                            )
                          ],
                        )), /* 
                    TextButton(
                      buttonName: "Terms & Condition",
                      onPressed: _onPressed,
                      buttonTextStyle: buttonTextStyle,
                    ) */
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
