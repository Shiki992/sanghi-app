import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sanghi/Utils/Navigator.dart';

import 'CPuja.dart';
import 'Ipuja.dart';
var fire = Firestore.instance;
class Puja extends StatefulWidget {
  @override
  _PujaState createState() => _PujaState();
}

class _PujaState extends State<Puja> {
  var page = 0;
  final tab = <Widget>[IPuja(), CPuja()];

  void _onItemTapped(int index) {
    setState(() {
      page = index;
      print(page);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Puja"),
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
                ),onTap: () => Navigator.pop(context),),
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
                  ),onTap: ()=>MyNavigator.goToAstro(context),),
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
                ),onTap: () => Navigator.pop(context),),
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
                ),onTap: () => MyNavigator.goToFest(context),),
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
                ),onTap: () => MyNavigator.goToCere(context),),
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
                ),onTap: () => Navigator.pop(context),),
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
                ),onTap: () => Navigator.pop(context),),
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
                ),onTap: () => Navigator.pop(context),),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          currentIndex: page,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: "General",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Custom"),
          ],
          onTap: _onItemTapped,
        ),
        body: tab[page],
    );
  }
}


