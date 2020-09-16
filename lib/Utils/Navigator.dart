import 'package:flutter/material.dart';
import 'package:sanghi/main.dart';

class MyNavigator {
  static void goToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/login");
  }

  static void goToReg(BuildContext context) {
    Navigator.pushNamed(context, "/register");
  }

  static void goToNumber(BuildContext context) {
    Navigator.pushNamed(context, "/number",arguments: type);
  }
}
