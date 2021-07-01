import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseRealtimeScreen extends StatelessWidget {
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    readData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Realtime Database'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text('Create Data'),
              color: Colors.redAccent,
              onPressed: () {
                createData();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            SizedBox(
              height: 8,
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text('Read/View Data'),
              color: Colors.redAccent,
              onPressed: () {
                readData();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            SizedBox(
              height: 8,
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text('Update Data'),
              color: Colors.redAccent,
              onPressed: () {
                updateData();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            SizedBox(
              height: 8,
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text('Delete Data'),
              color: Colors.redAccent,
              onPressed: () {
                deleteData();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ],
        ),
      )), //center
    );
  }

  void createData() {
    databaseReference
        .child("kullanici")
        .set({'name': 'Deepak Nishad', 'email': 'dene@q.com', 'sifre': 'qwe'});
  }

  void readData() {
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  void updateData() {
    databaseReference.child('flutterDevsTeam1').update({'description': 'CEO'});
    databaseReference
        .child('flutterDevsTeam2')
        .update({'description': 'Team Lead'});
    databaseReference
        .child('flutterDevsTeam3')
        .update({'description': 'Senior Software Engineer'});
  }

  void deleteData() {
    databaseReference.child('flutterDevsTeam1').remove();
    databaseReference.child('flutterDevsTeam2').remove();
    databaseReference.child('flutterDevsTeam3').remove();
  }
}
