import 'package:demo_app/models/config.dart';
import 'package:demo_app/pages/buttons.dart';
import 'package:demo_app/pages/inputField.dart';
import 'package:demo_app/pages/main.dart';
import 'package:demo_app/pages/signup.dart';
import 'package:demo_app/pages/theme.dart';
import 'package:demo_app/pages/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

DecorationImage backgroundImage = DecorationImage(
  image: ExactAssetImage('assets/login-screen-background.png'),
  fit: BoxFit.cover,
);

ExactAssetImage logo = ExactAssetImage("assets/logo.png");

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  BuildContext context;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController = ScrollController();
  bool autovalidate = false;
  Validations validations = Validations();

  _onPressed() {
    print("button clicked");
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  void _handleSubmitted() async {
    final FormState form = formKey.currentState;
    if (!form.validate()) {
      autovalidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => MainPage(),
        ),
      );
    }
  }

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    final Size screenSize = MediaQuery.of(context).size;
    //print(context.widget.toString());
    Validations validations = Validations();
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
            controller: scrollController,
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(image: backgroundImage),
              child: Column(
                children: <Widget>[
                  Container(
                    height: screenSize.height / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Image(
                            image: logo,
                            width: (screenSize.width < 500)
                                ? 120.0
                                : (screenSize.width / 4) + 12.0,
                            height: screenSize.height / 4 + 20,
                          ),
                        ),
                        Center(
                          child: Text(
                            'Demo App',
                            style: const TextStyle(
                              color: const Color(0XFFFFFFFF),
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: screenSize.height / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Form(
                          key: formKey,
                          autovalidate: autovalidate,
                          child: Column(
                            children: <Widget>[
                              InputField(
                                  hintText: "Email",
                                  obscureText: false,
                                  textInputType: TextInputType.text,
                                  textStyle: textStyle,
                                  textFieldColor: textFieldColor,
                                  icon: Icons.mail_outline,
                                  iconColor: Colors.white,
                                  bottomMargin: 20.0,
                                  validateFunction: validations.validateEmail,
                                  onSaved: (String e) {
                                    email = e;
                                  }),
                              InputField(
                                  hintText: "Password",
                                  obscureText: true,
                                  textInputType: TextInputType.text,
                                  textStyle: textStyle,
                                  textFieldColor: textFieldColor,
                                  icon: Icons.lock_open,
                                  iconColor: Colors.white,
                                  bottomMargin: 30.0,
                                  validateFunction:
                                      validations.validatePassword,
                                  onSaved: (String p) {
                                    password = p;
                                  }),
                              RoundedButton(
                                buttonName: "Login",
                                onTap: _handleSubmitted,
                                width: screenSize.width,
                                height: 50.0,
                                bottomMargin: 10.0,
                                borderWidth: 0.0,
                                buttonColor: primaryColor,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextButton(
                                buttonName: "Create Account",
                                onPressed: () => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SignUpPage(),
                                    )),
                                buttonTextStyle: buttonTextStyle),
                            TextButton(
                                buttonName: "Need Help?",
                                onPressed: _onPressed,
                                buttonTextStyle: buttonTextStyle)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
