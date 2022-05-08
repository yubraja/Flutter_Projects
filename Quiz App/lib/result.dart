import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function() resetQuiz;
  Result(this.resetQuiz);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "You are Awesome and Innocent!!",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        TextButton(
          onPressed: resetQuiz,
          child: Text("Restart"),
          style: TextButton.styleFrom(
            primary: Colors.blue,
            textStyle: const TextStyle(fontSize: 30),
          ),
        ),
      ],
    );
  }
}
