import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sanghi/main.dart';

class MyNavigator {
  static void goToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/login");
  }

  static void goToReg(BuildContext context) {
    Navigator.pushNamed(context, "/register");
  }

  static void goToNumber(BuildContext context) {
    Navigator.pushNamed(context, "/number");
  }

  static void goToDocs1(BuildContext context) {
    Navigator.pushNamed(context, "/docs1");
  }

  static void goToDocs2(BuildContext context) {
    Navigator.pushNamed(context, "/docs2");
  }
  static void goToupJobs(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, "/ujobs",ModalRoute.withName('/'));
  }

  static void goTouJobDet(BuildContext context) {
    Navigator.pushNamed(context, "/ujobdet");
  }

  static void goTopJobDet(BuildContext context) {
    Navigator.pushNamed(context, "/pjobdet");
  }

  static void goToPujaList(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, "/pujalist", ModalRoute.withName('/'));
  }

  static void goToPuja(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/pujalist");
  }

  static void goToAstro(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/Astrology");
  }

  static void goToCere(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/Ceremonies");
  }

  static void goToFest(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/Festivals");
  }

  static void goToFRes(BuildContext context) {
    Navigator.pushNamed(context, "/FRes");
  }

  static void goToFCon(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, "/FConfirm",ModalRoute.withName('/Festivals'));
  }
  static void goToPRes(BuildContext context) {
    Navigator.pushNamed(context, "/PRes");
  }
}
