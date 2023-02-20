import 'package:flutter/material.dart';
import 'dart:async';
import '../pages/third_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  static final routeName = '/firstPage';

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(ThirdPage.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Image.asset(
      'assets/1stpage.png',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    ));
  }
}
