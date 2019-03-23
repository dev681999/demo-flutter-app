import 'package:demo_app/pages/login.dart';
import 'package:demo_app/pages/main.dart';
import 'package:demo_app/pages/theme.dart';
import 'package:flutter/material.dart';

Drawer drawer(context) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text(''),
          decoration: BoxDecoration(
            color: primaryColor,
            image: DecorationImage(
              image: ExactAssetImage('assets/logo.png'),
              // fit: BoxFit.fit,
            ),
          ),
        ),
        ListTile(
          title: Text('Home'),
          onTap: () {
            while (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => MainPage(),
              ),
            );
          },
        ),
        ListTile(
          title: Text('Logut'),
          onTap: () {
            while (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => LoginPage(),
              ),
            );
          },
        ),
      ],
    ),
  );
}
