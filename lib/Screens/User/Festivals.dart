import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sanghi/Utils/Navigator.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:sanghi/Utils/timezonepicker.dart';

var fire = Firestore.instance;
var fest;

class Festivals extends StatefulWidget {
  @override
  _FestivalsState createState() => _FestivalsState();
}

class _FestivalsState extends State<Festivals> {
  Widget _buildstate(BuildContext context, DocumentSnapshot document, int count) {
    print(count);
    return ListTile(
        onTap: () async {
          fest = document['Service Name'];
          MyNavigator.goToFRes(context);
//          MyNavigator.goTouJobDet(context);
        },
        title: Card(
          elevation: 5,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
              ),
              Expanded(
                child: Text(
                  count.toString(),
                ),
                flex: 1,
              ),
              Expanded(
                child: Text(
                  document['Service Name'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                flex: 5,
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 66, 0),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Festivals"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            DrawerHeader(
                child: Column(
                  children: <Widget>[],
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('Assets/images/OM.png')), color: Colors.transparent)),
            Text(
              "Main Menu",
              style: new TextStyle(color: Colors.red[800], fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            ListTile(
              title: Container(
                height: 50,
                width: 25,
                child: Card(
                  child: Center(
                      child: Text(
                    "Puja",
                  )),
                  elevation: 0,
                ),
              ),
              onTap: () => MyNavigator.goToPuja(context),
            ),
            ListTile(
                title: Container(
                  height: 50,
                  width: 25,
                  child: Card(
                    child: Center(
                        child: Text(
                      "Astrology",
                    )),
                    elevation: 0,
                  ),
                ),
                onTap: () => MyNavigator.goToAstro(context)),
            ListTile(
              title: Container(
                height: 50,
                width: 25,
                child: Card(
                  child: Center(
                      child: Text(
                    "Teaching - Learning",
                  )),
                  elevation: 0,
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Container(
                height: 50,
                width: 25,
                child: Card(
                  child: Center(
                      child: Text(
                    "Festivals",
                  )),
                  elevation: 0,
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Container(
                height: 50,
                width: 25,
                child: Card(
                  child: Center(
                      child: Text(
                    "Ceremonies",
                  )),
                  elevation: 0,
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Container(
                height: 50,
                width: 25,
                child: Card(
                  child: Center(
                      child: Text(
                    "Fundraisers",
                  )),
                  elevation: 0,
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Container(
                height: 50,
                width: 25,
                child: Card(
                  child: Center(
                      child: Text(
                    "History",
                  )),
                  elevation: 0,
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Container(
                height: 50,
                width: 25,
                child: Card(
                  child: Center(
                      child: Text(
                    "Contact us",
                  )),
                  elevation: 0,
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          StreamBuilder(
              stream: fire.collectionGroup("Services").where("Service Type", isEqualTo: "Festivals").snapshots(),
              builder: (context, snapshot) {
                num count = 0;
                if (!snapshot.hasData) return const Text("Loading");
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemExtent: 65,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      count += 1;
                      return _buildstate(context, snapshot.data.documents[index], count);
//                  return Text(count.toString());
                    });
              })
        ],
      ),
    );
  }
}

class FReq extends StatefulWidget {
  @override
  _FReqState createState() => _FReqState();
}

class _FReqState extends State<FReq> {
  var _formkey = GlobalKey<FormState>();
  var radval = "";
  var type;

  String _date = "Not set";
  var _time = "Not Set";
  var _timezone;

  void Handler(String val) {
    setState(() {
      radval = val;
      switch (radval) {
        case "Single":
          {
            type = 'Single';
            break;
          }
        case "Pool":
          {
            type = 'Pool';
            break;
          }
      }
    });
  }
  void _showDialog1() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Are you sure?"),
          content: new Text("Puja: ${fest}\n Date: ${_date}\n Time: ${_time}\n Type: ${type}",style: TextStyle(fontSize: 20),),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Edit"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Confirm"),
              onPressed: () {
                MyNavigator.goToFCon(context);
              },
            )
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    var hasSelectedItemBuilder;
    Country country;


    return Scaffold(
      appBar: AppBar(
        title: Text(fest),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          child: Column(
            key: _formkey,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
//                                  color: Colors.red[200],
//                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),side: BorderSide(color: Colors.red[800])),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                    ),
                    new Radio<String>(value: "Single", groupValue: radval, onChanged: Handler),
                    new Text("Single",
                        style: new TextStyle(
                          color: Colors.red[900],
                          fontWeight: FontWeight.bold,
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                    ),
                    new Radio<String>(value: "Pool", groupValue: radval, onChanged: Handler),
                    new Text("Pool", style: new TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold)),

//                                      Container(height: 50,decoration: BoxDecoration(), child: TextFormField())
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(10),),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      elevation: 4.0,
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            theme: DatePickerTheme(
                              containerHeight: 210.0,
                            ),
                            showTitleActions: true,
                            minTime: DateTime(2000, 1, 1),
                            maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                          print('confirm $date');
                          _date = '${date.year} - ${date.month} - ${date.day}';
                          setState(() {});
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.date_range,
                                        size: 18.0,
                                        color: Colors.red[800],
                                      ),
                                      Text(
                                        " $_date",
                                        style: TextStyle(
                                            color: Colors.red[800], fontWeight: FontWeight.bold, fontSize: 18.0),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "  Change",
                              style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                      color: Colors.white,
                    ),
//                    SizedBox(
//                        width: dropdownItemWidth,
//                        child: Padding(
//                            padding: const EdgeInsets.all(8),
//                            child: Row(
//                              children: <Widget>[
//                                CountryPickerUtils.getDefaultFlagImage(country),
//                                SizedBox(
//                                  width: 8.0,
//                                ),
//                                Expanded(
//                                    child: Text(
//                                      '+${country.phoneCode}(${country.iso3Code})',
//                                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
//                                    )),
//                              ],
//                            ))),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      elevation: 4.0,
                      onPressed: () {
                        DatePicker.showTimePicker(context,
                            theme: DatePickerTheme(
                              containerHeight: 210.0,
                            ),
                            showTitleActions: true, onConfirm: (time) {
                          print('confirm $time');
                          _time = '${time.hour} : ${time.minute} : ${time.second}';
                          setState(() {});
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.access_time,
                                        size: 18.0,
                                        color: Colors.red[800],
                                      ),
                                      Text(
                                        " ${_time}",
                                        style: TextStyle(
                                            color: Colors.red[800], fontWeight: FontWeight.bold, fontSize: 18.0),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "  Change",
                              style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      elevation: 4.0,
                      onPressed: () async {
                        _timezone=await TimeZonePicker.launch(context);
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_on,
                                        size: 18.0,
                                        color: Colors.red[800],
                                      ),
                                      Text(
                                        " ${_timezone}",
                                        style: TextStyle(
                                            color: Colors.red[800], fontWeight: FontWeight.bold, fontSize: 18.0),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "  Change",
                              style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),

              
              Padding(padding: EdgeInsets.all(35),),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2, color: Colors.white, style: BorderStyle.solid)
//                                      borderRadius: BorderRadius.circular(70)
                ),
                elevation: 4,
                color: Colors.red[800],
                child: Container(
                    height: 30,
                    width: 100,
                    child: Center(
                      child: Text(
                        "Submit Request",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    )),
                onPressed: () {
                  _showDialog1();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FConfirm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Booking Confirmation"),centerTitle: true,),);
  }
}
