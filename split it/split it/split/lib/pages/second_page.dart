import 'package:flutter/material.dart';
import '../widgets/addinformation.dart';

class SecondPage extends StatelessWidget {
  static final routeName = '/secondPage';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(189, 158, 255, 1),
      body: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.23209,
          left: size.width * 0.063661828,
        ),
        child: Column(
          children: [
            Text(
              'ADD INFORMATION',
              style: TextStyle(
                  color: Color.fromRGBO(36, 1, 92, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: size.width * 0.871265597,
              height: size.height * 0.541371279,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(36, 1, 92, 1),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(30),
                color: Color.fromARGB(255, 236, 229, 252),
              ),
              child: AddInformation(),
            ),
          ],
        ),
      ),
    );
  }
}
