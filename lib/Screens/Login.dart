import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sanghi/Utils/Navigator.dart' as MyNavigator;
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/country.dart';

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
  var username, password;
  var radval = "";
  var type, aut;

  @override
  void initState() {
    super.initState();
//    aut = Firestore.instance
//        .collectionGroup(radval)
//        .where('username', isEqualTo: username)
//        .snapshots();
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

  Widget _buildDropdownItem(Country country, double dropdownItemWidth) => SizedBox(
        width: dropdownItemWidth,
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(
              width: 8.0,
            ),
            Expanded(child: Text("${country.name}")),
          ],
        ),
      );

  Widget _buildDropdownSelectedItemBuilder(Country country, double dropdownItemWidth) => SizedBox(
      width: dropdownItemWidth,
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              CountryPickerUtils.getDefaultFlagImage(country),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                  child: Text(
                '+${country.phoneCode}(${country.iso3Code})',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )),
            ],
          )));

  _buildCountryPickerDropdown(
      {bool filtered = true,
      bool sortedByIsoCode = false,
      bool hasPriorityList = false,
      bool hasSelectedItemBuilder = false}) {
    double dropdownButtonWidth = MediaQuery.of(context).size.width * 0.4;
    double dropdownItemWidth = dropdownButtonWidth - 10;
    double dropdownSelectedItemWidth = dropdownButtonWidth - 30;
    return Row(
      children: <Widget>[
        SizedBox(
          width: dropdownButtonWidth,
          child: CountryPickerDropdown(
            //show'em (the text fields) you're in charge now
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            //if you have menu items of varying size, itemHeight being null respects
            //that, IntrinsicHeight under the hood ;).
            itemHeight: 100,
            //itemHeight being null and isDense being true doesn't play along
            //well together. One is trying to limit size and other is saying
            //limit is the sky, therefore conflicts.
            //false is default but still keep that in mind.
            isDense: false,
            //if you want your dropdown button's selected item UI to be different
            //than itemBuilder's(dropdown menu item UI), then provide this selectedItemBuilder.
            selectedItemBuilder: hasSelectedItemBuilder == true
                ? (Country country) => _buildDropdownSelectedItemBuilder(country, dropdownSelectedItemWidth)
                : null,
            itemBuilder: (Country country) => hasSelectedItemBuilder == true
                ? _buildDropdownItem(country, dropdownItemWidth)
                : _buildDropdownItem(country, dropdownItemWidth),
            initialValue: 'IN',
            itemFilter: filtered ? (c) => ['IN', 'AR', 'DE', 'GB', 'CN'].contains(c.isoCode) : null,
            //priorityList is shown at the beginning of list
            priorityList: hasPriorityList
                ? [
                    CountryPickerUtils.getCountryByIsoCode('GB'),
                    CountryPickerUtils.getCountryByIsoCode('CN'),
                  ]
                : null,
            sortComparator: sortedByIsoCode ? (Country a, Country b) => a.isoCode.compareTo(b.isoCode) : null,
            onValuePicked: (Country country) {
              print("+${country.phoneCode}");
            },
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: Colors.red[800],
              labelText: "Phone",
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
            keyboardType: TextInputType.phone,
          ),
        )
      ],
    );
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
                            color: Colors.orange[200],
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
                                            if (value.isEmpty) {
                                              return 'Please enter a Name.';
                                            } else {
                                              username = value;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
//                                Padding(
//                                  padding: EdgeInsets.all(10),
//                                ),
                                Container(
//                                  height: 50,
//                                 width: 300,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
//                                      Text('CountryPickerDropdown (selectedItemBuilder)'),
                                      _buildCountryPickerDropdown(hasSelectedItemBuilder: true),
                                      //ListTile(title: _buildCountryPickerDropdown(longerText: true)),
                                    ],
                                  ),
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
                                      ),
                                  elevation: 4,
                                  color: Colors.red[800],
                                  child: Container(
                                      height: 30,
                                      width: 85,
                                      child: Center(
                                        child: Text(
                                          "Log in",
                                          style: TextStyle(color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  onPressed: () {
                                    type = 0;
                                    print(type);
                                    MyNavigator.MyNavigator.goToNumber(context,type);
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
                                            onPressed: () {
                                              type = 1;
                                              print(type);
                                              MyNavigator.MyNavigator.goToNumber(context,type);
                                            },
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
