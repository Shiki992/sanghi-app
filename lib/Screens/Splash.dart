import 'package:flutter/material.dart';
import 'package:sanghi/Utils/Navigator.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  void initState()
  {
    super.initState();
    Timer(Duration(seconds: 5),() => MyNavigator.goToLogin(context));
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: Center(
      child: Hero(
          tag: 'Logo',
          child: Image(
              image: AssetImage('Assets/images/OM.png'))),
    ));
  }
}
