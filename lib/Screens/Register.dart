import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration', textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(20),),
            Column(
              children: [
                Container(
                  width: 300,
                  height: 50,
                  child: Card(
                    color: Color.fromRGBO(0, 40, 125, 100),
                    elevation: 7.0,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage('Assets/images/facebook.png'),
                          width: 40,
                          height: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                        ),
                        Text(
                          "Sign up using Facebook",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    width: 300,
                    height: 50,
                    child: Card(
                      color: Colors.white,
                      elevation: 7.0,
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('Assets/images/google.png'),
                            width: 40,
                            height: 40,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 50.0),
                          ),
                          Text(
                            "Sign up using Google",
                            style: TextStyle(color: Colors.red[700], fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    )),
                Form(key:_formkey,child: ListView(
                  children: [
                    Container()
                  ],

                ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
