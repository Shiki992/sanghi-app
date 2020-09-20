import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sanghi/Screens/Pujari/pJobs.dart';
import 'package:sanghi/Screens/Pujari/uJob.dart';

class uJobs extends StatefulWidget {
  @override
  _uJobsState createState() => _uJobsState();
}

class _uJobsState extends State<uJobs> {
  var page = 0;
  final tab = <Widget>[uJob(), pJobs()];

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
        title: page == 0 ? Text("Upcoming Jobs") : Text("Past Jobs"),
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
                  "Jobs",
                )),
                elevation: 5,
              ),
            ),onTap: () => Navigator.pop(context),),
            ListTile(
                title: Container(
                  height: 50,
                  width: 25,
                  child: Card(
                    child: Center(
                        child: Text(
                          "Profile",
                        )),
                    elevation: 5,
                  ),
                ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.md_clipboard),
            label: "Upcoming Jobs",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: "Completed Jobs"),
        ],
        onTap: _onItemTapped,
      ),
      body: tab[page],
    );
  }
}
