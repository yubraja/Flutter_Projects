import 'package:flutter/material.dart';
import '../widgets/associative_payments.dart';
import '../widgets/button_display.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  static final routeName = '/thirdPage';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(189, 158, 255, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AssociativePayments(typePaid: 'COLLABORATIVE PAYMENTS'),
            AssociativePayments(typePaid: 'INDIVIDUAL PAYMENTS'),
            ButtonDisplay(),
          ],
        ),
      ),
    );
  }
}
