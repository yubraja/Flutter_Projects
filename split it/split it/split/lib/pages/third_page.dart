import 'package:flutter/material.dart';
import '../widgets/associative_payments.dart';
import '../widgets/button_display.dart';


class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: false,
      body: Column(
        children: [

          AssociativePayments(typePaid:'COLLABORATIVE PAYMENTS'),
          AssociativePayments(typePaid:'INDIVIDUAL PAYMENTS'),
          ButtonDisplay(),


        ],
      ),
    );
  }
}
