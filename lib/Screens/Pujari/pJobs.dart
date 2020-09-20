import 'package:flutter/material.dart';
import 'package:sanghi/Utils/Navigator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class pJobs extends StatelessWidget {
  Widget _buildstate(BuildContext context, DocumentSnapshot document, int count) {
    return ListTile(
        onTap: () async {
          MyNavigator.goTopJobDet(context);
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
                  document['Type'],
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
    return StreamBuilder(
        stream: Firestore.instance
            .collectionGroup("Jobs")
            .where("pDocIDs", arrayContains: "5jKCVd46bQ5oCwD0zIcY",)
            .where("isDone", isEqualTo: false)
            .snapshots(),
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
              });
        });
  }
}

class pJobDet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Previous Job Details"),centerTitle: true,),
      body: ListView(children: [Padding(padding: EdgeInsets.all(30)), Text("Job Type : ")],),
    );
  }
}
