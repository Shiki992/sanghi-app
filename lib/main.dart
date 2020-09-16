import 'package:flutter/material.dart';
import 'package:sanghi/Screens/Splash.dart';
import 'package:sanghi/Screens/Login.dart';
import 'package:sanghi/Screens/Pujari/Register.dart';
import 'package:sanghi/Screens/phone_verification.dart';

var type;
var Routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => Login(),
  "/register": (BuildContext context) => Register(),
  "/number": (BuildContext context) => PhoneVeri(type:type),
};

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanghi Puja App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        secondaryHeaderColor: Colors.redAccent[400],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
        debugShowCheckedModeBanner: false,
        routes: Routes
    );
  }
}
