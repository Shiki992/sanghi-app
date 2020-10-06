import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sanghi/Utils/Navigator.dart';

var fire = Firestore.instance;
class Astrology extends StatefulWidget {
  @override
  _AstrologyState createState() => _AstrologyState();
}

class _AstrologyState extends State<Astrology> {

  Widget _buildstate(BuildContext context, DocumentSnapshot document, int count) {
    print(count);
    return ListTile(
        onTap: () async {
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
        title: Text("Astrology"),
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
              ),onTap: () => MyNavigator.goToPuja(context),),
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
                ),onTap: () => Navigator.pop(context)),
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

      body: ListView(
        children: [
          StreamBuilder(
              stream: fire.collectionGroup("Services").where("Service Type", isEqualTo: "Astrology").snapshots(),
              builder: (context,snapshot){
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


