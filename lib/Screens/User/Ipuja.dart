import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sanghi/Utils/Navigator.dart';

class IPuja extends StatelessWidget {
var fire = Firestore.instance;

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
    return ListView(
      children: [
        StreamBuilder(
            stream: fire.collectionGroup("Services").where("Service Type", isEqualTo: "Puja").snapshots(),
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
    );
  }
}