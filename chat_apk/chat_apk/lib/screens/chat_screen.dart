import 'package:flutter/material.dart';

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
    );
  }
}
