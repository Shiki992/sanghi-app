import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sanghi/Utils/Navigator.dart';

//import 'package:firebase_auth/firebase_auth.dart';
//import 'Utils/Navigator.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter_icons/flutter_icons.dart';
//
//final FirebaseAuth _auth = FirebaseAuth.instance;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  var userid, password;
  var radval = "";
  var type, aut;

  @override
  void initState() {
    super.initState();
//    aut = Firestore.instance
//        .collectionGroup(radval)
//        .where('UserID', isEqualTo: userid)
//        .snapshots();
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text("Invalid Userid or Password"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialog1() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text("Please Enter Userid"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialog2() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Success"),
          content: new Text("Please Check your email for further instructions"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<String> signIn(String email, String password) async {
//    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
//    FirebaseUser user = result.user;
//    return user.uid;
  }

  Future<String> resetPassword(String email) async {
//    await _auth.sendPasswordResetEmail(email: email);

    return 'Please Check your email';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Center(
                      child: Hero(
                          tag: 'Logo',
                          child: Container(
                            width: 255,
                            height: 255,
                            /*backgroundColor: Colors.white, radius: 150.0child: Image.asset('Images/pp.jpeg')*/
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(image: AssetImage('Assets/images/om.png'))),
                          ))),
                  Padding(
                    padding: EdgeInsets.all(0),
                  ),
                  Center(
                      child: Container(
                          width: 350,
                          height: 420,
                          child: Card(
                            color: Colors.white,
                            elevation: 10,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10),
                                ),
                                Text('Login',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(color: Colors.red[700], fontSize: 30, fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                ),
                                Container(
                                  height: 50,
                                  width: 300,
                                  decoration:
                                      BoxDecoration(color: Colors.red[200], borderRadius: BorderRadius.circular(40)),
//                                  color: Colors.red[200],
//                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),side: BorderSide(color: Colors.red[800])),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 15),
                                      ),
                                      Container(
                                        width: 265,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'Name',
                                              labelStyle: TextStyle(color: Colors.red[800]),
                                              icon: Icon(
                                                Icons.person_outline,
                                                color: Colors.black,
                                              )),
                                          validator: (value) {
                                            if(value.isEmpty){return 'Please enter a Name.';}
                                            else{userid = value;}

                                          },
                                        ),
                                      ),

//                                      Container(height: 50,decoration: BoxDecoration(), child: TextFormField())
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                ),
                                Container(
                                  height: 50,
                                  width: 300,
                                  decoration:
                                      BoxDecoration(color: Colors.red[200], borderRadius: BorderRadius.circular(40)),
//                                  color: Colors.red[200],
//                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),side: BorderSide(color: Colors.red[800])),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 15),
                                      ),
                                      Container(
                                        width: 265,
                                        child: TextFormField(
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                              labelText: 'Phone number',
                                              labelStyle: TextStyle(color: Colors.red[800]),
                                              icon: Icon(
                                                Icons.phone,
                                                color: Colors.black,
                                              )),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter a valid phone number.';
                                            } else {
                                              password = value;
                                            }
                                          },
                                        ),

//                                      Container(height: 50,decoration: BoxDecoration(), child: TextFormField())
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                ),
                                Container(
                                  height: 50,
                                  width: 300,
                                  decoration:
                                  BoxDecoration(color: Colors.red[200], borderRadius: BorderRadius.circular(40)),
//                                  color: Colors.red[200],
//                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),side: BorderSide(color: Colors.red[800])),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 15),
                                      ),
                                      Container(
                                        width: 265,
                                        child: TextFormField(
                                          keyboardType: TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              labelText: 'Email ID',
                                              labelStyle: TextStyle(color: Colors.red[800]),
                                              icon: Icon(
                                                Icons.alternate_email,
                                                color: Colors.black,
                                              )),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter a valid phone number.';
                                            } else {
                                              password = value;
                                            }
                                          },
                                        ),

//                                      Container(height: 50,decoration: BoxDecoration(), child: TextFormField())
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                ),
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 2, color: Colors.white, style: BorderStyle.solid)
//                                      borderRadius: BorderRadius.circular(70)
                                  ),elevation: 4,
                                  color: Colors.red[800],
                                  child: Container(
                                    height: 30,
                                    width: 85,
                                    child: Center(child: Text(
                                      "Log in",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),)
                                  ),
                                  onPressed: () async {
//                                    MyNavigator.goToPatient(context);
//
//                                        _auth = await signIn(userid, password);
//                                    if (_auth == null || aut.isEmpty == true) {
//                                      _showDialog();
//                                    } else {}
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.all(0),
                                ),
//                                Padding(
//                                  padding: EdgeInsets.all(0),
//                                ),
                                Container(
                                  height: 50,
                                  width: 300,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
//                                  color: Colors.red[200],
//                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),side: BorderSide(color: Colors.red[800])),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 87.5),
                                      ),
                                      Card(
                                        elevation: 4,
                                        child: FlatButton(
                                            onPressed: null,
                                            child: new Text(
                                              "Work with us",
                                              style: new TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
                                            )),
                                      )

//                                      Container(height: 50,decoration: BoxDecoration(), child: TextFormField())
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )))
                ],
              ))
        ],
      ),
    );
  }
}
