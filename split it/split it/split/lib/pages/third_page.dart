import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:split/widgets/associative_payments.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: Column(
        children: [

          AssociativePayments(),
        ],
      ),
    );
  }
}
