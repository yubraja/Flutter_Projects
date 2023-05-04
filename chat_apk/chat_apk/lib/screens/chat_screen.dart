import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ChatApp"),
        ),
        body: ListView.builder(
          itemBuilder: ((context, index) => Container(
                padding: EdgeInsets.all(8),
                child: Text('Hello Everyone'),
              )),
          itemCount: 10,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (() {
            final firestore = FirebaseFirestore.instance;
            firestore
                .collection('messages/F25hXek1gAJAfhCMwvnS/chat')
                .snapshots()
                .listen((data) {
              print(data);
            }); 
          }),
        ));
  }
}
