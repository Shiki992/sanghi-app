import 'package:flutter/material.dart';
import 'package:sanghi/main.dart';

class MyNavigator {
  static void goToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/login");
  }

  static void goToReg(BuildContext context) {
    Navigator.pushNamed(context, "/register");
  }

  static void goToNumber(BuildContext context, int type) {
    Navigator.pushNamed(context, "/number",arguments: type);
  }

  static void goToDocs1(BuildContext context) {
    Navigator.pushNamed(context, "/docs1");
  }

  static void goToDocs2(BuildContext context) {
    Navigator.pushNamed(context, "/docs2");
  }
  static void goToupJobs(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/ujobs");
  }

  static void goTouJobDet(BuildContext context) {
    Navigator.pushNamed(context, "/ujobdet");
  }

  static void goTopJobDet(BuildContext context) {
    Navigator.pushNamed(context, "/pjobdet");
  }
}
