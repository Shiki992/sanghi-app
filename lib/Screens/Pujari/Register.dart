import 'package:flutter/material.dart';
import 'package:sanghi/Utils/Navigator.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  var _textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 100, 0, 0)),
            Center(
                child: Container(
                    width: 300,
                    child: Stack(
                      children: [
                        StepProgressIndicator(
                          totalSteps: 100,
                          currentStep: 34,
                          size: 30,
                          padding: 0,
                          selectedColor: Colors.red[800],
                          unselectedColor: Colors.white30,
                          roundedEdges: Radius.circular(10),
                          selectedGradientColor: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.orange, Colors.redAccent[700]],
                          ),
                          unselectedGradientColor: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.lightGreenAccent, Colors.green],
                          ),
                        ),

                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.orange[300],
                              radius: 15,
                              child: Text("1/3"),
                            )
                          ],
                        ),

//                      Padding(padding: EdgeInsets.fromLTRB(0, 100, 0, 100),
                      ],
                    ))),
            Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
            Text(
              "Please wait while we schedule a meeting with our admins with the details we provided.\n Please Enter the Code you recieved from our admin to complete the registration.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22.5),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 2, 0, 0)),
            Container(
                width: 250,
                child: TextField(
                  controller: _textcontroller,
                  decoration: InputDecoration(
                      fillColor: Colors.red[800],
                      hintText: "Please enter the code here",
                      hintStyle: TextStyle(color: Colors.redAccent)),
                )),
            Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: Colors.white, style: BorderStyle.solid)
//                                      borderRadius: BorderRadius.circular(70)
              ),
              elevation: 4,
              color: Colors.red[800],
              child: Container(
                  height: 30,
                  width: 85,
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )),
              onPressed: () async {
                return MyNavigator.goToDocs1(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
