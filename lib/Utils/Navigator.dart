import 'package:flutter/material.dart';

class MyNavigator {
  static void goToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/login");
  }
  static void goToRegister(BuildContext context) {
    Navigator.pushNamed(context, "/register");
  }
}
