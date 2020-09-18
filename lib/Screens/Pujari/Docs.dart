import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sanghi/Utils/Navigator.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Docs extends StatefulWidget {
  @override
  _DocsState createState() => _DocsState();
}

class _DocsState extends State<Docs> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(50)),
          Center(
              child: Container(
                  width: 300,
                  child: Stack(
                    children: [
                      StepProgressIndicator(
                        totalSteps: 100,
                        currentStep: 67,
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
                            child: Text("2/3"),
                          )
                        ],
                      ),

//                      Padding(padding: EdgeInsets.fromLTRB(0, 100, 0, 100),
                    ],
                  ))),
          Padding(padding: EdgeInsets.all(20)),
          Center(
              child: Text(
            "Thank you for partnering with us!\n To complete the registration process, we will need additional details",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
          Form(
              key: _formkey,
              child: Center(
                child: Column(
                  children: [
                    Container(
                        width: 250,
                        child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Aadhar Card number',
                                labelStyle: TextStyle(color: Colors.red[800]),
                                icon: Icon(
                                  Entypo.v_card,
                                  color: Colors.black,
                                )))),
                    Padding(padding: EdgeInsets.all(10)),
                    RaisedButton(child: Text("Next",),onPressed: ()=>MyNavigator.goToDocs2(context),)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class Docs2 extends StatefulWidget {
  @override
  _Docs2State createState() => _Docs2State();
}

class _Docs2State extends State<Docs2> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(50)),
          Center(
              child: Container(
                  width: 300,
                  child: Stack(
                    children: [
                      StepProgressIndicator(
                        totalSteps: 100,
                        currentStep: 95,
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
                            child: Text("3/3"),
                          )
                        ],
                      ),

//                      Padding(padding: EdgeInsets.fromLTRB(0, 100, 0, 100),
                    ],
                  ))),
          Padding(padding: EdgeInsets.all(20)),
          Center(
              child: Text(
                "Thank you for partnering with us!\n To complete the registration process, we will need additional details",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
          Form(
              key: _formkey,
              child: Center(
                child: Column(
                  children: [
                    Container(
                        width: 250,
                        child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Aadhar Card number',
                                labelStyle: TextStyle(color: Colors.red[800]),
                                icon: Icon(
                                  Entypo.v_card,
                                  color: Colors.black,
                                )))),
                    Padding(padding: EdgeInsets.all(10)),
                    Container(
                        width: 250,
                        child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Aadhar Card number',
                                labelStyle: TextStyle(color: Colors.red[800]),
                                icon: Icon(
                                  Entypo.v_card,
                                  color: Colors.black,
                                )))),
                    Padding(padding: EdgeInsets.all(10)),
                    RaisedButton(child: Text("Next",),onPressed: () => MyNavigator.goToupJobs(context),)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
