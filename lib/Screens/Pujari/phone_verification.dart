import 'package:flutter/material.dart';
import 'package:sanghi/Utils/Navigator.dart' as MyNavigator;
import 'package:sanghi/main.dart';


class PhoneVeriP extends StatefulWidget {

  PhoneVeriP({Key key}) : super(key: key);

  @override
  _PhoneVeriPState createState() => _PhoneVeriPState();
}

class _PhoneVeriPState extends State<PhoneVeriP> {
  var _textcontroller = TextEditingController();
//  _PhoneVeriState(this.type);
  @override
  void initState() {

    super.initState();
//    aut = Firestore.instance
//        .collectionGroup(radval)
//        .where('username', isEqualTo: username)
//        .snapshots();
  }
  @override
  Widget build(BuildContext context) {
//    int tp = widget.type;
//    final PhoneVeri args = ModalRoute.of(context).settings.arguments;
//    print(args.type);
    return Scaffold(
      backgroundColor: Colors.white,
//      drawer: Drawer(child: ListView(),),
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: ()=>Navigator.pop(context),),),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 200, 0, 0)),
            Text(
              "Please Enter the OTP sent to you via SMS to verify your number.",
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
              ),
              elevation: 4,
              color: Colors.red[800],
              child: Container(
                  height: 30,
                  width: 85,
                  child: Center(
                    child: Text(
                      "Verify",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )),
              onPressed: () {
                MyNavigator.MyNavigator.goToReg(context);
              }
            ),
          ],
        ),
      ),
    );
  }
}