import "package:flutter/material.dart";
import './home.dart';

void main() => runApp(My_app());

class My_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (MaterialApp(debugShowCheckedModeBanner: false, home: Home()));
  }
}
