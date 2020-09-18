import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sanghi/Screens/Pujari/uJob.dart';

class uJobs extends StatefulWidget {
  @override
  _uJobsState createState() => _uJobsState();
}

class _uJobsState extends State<uJobs> {
  var page = 0;
  final tab = <Widget>[
    Container(child: Center(child:Text('Under Development of Ongoing Jobs',textAlign: TextAlign.center,))),
    Container(child: Center(child:Text('Under Development of Completed Jobs',textAlign: TextAlign.center,)))
  ];
  void _onItemTapped(int index) {
    setState(() {
      page = index;
      print(page);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
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