import 'package:flutter/material.dart';
import './quiz.dart';
import "./result.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  final _questions = const [
    {
      'questionText': "what is your favorite color?",
      'answers': [
        'Black',
        'Red',
        'Green',
        'Blue',
      ],
    },
    {
      'questionText': "what is your favorite animal?",
      'answers': [
        'Tiger',
        'Lion',
        'Panda',
        'Horse',
      ],
    },
    {
      'questionText': "what is your favorite food?",
      'answers': [
        'MOMO',
        'Biryani',
        'Sizzler',
        'Burger',
      ],
    },
    {
      'questionText': "what is your favorite Place?",
      'answers': [
        'Lumbini',
        'Pashupati',
        'Bar',
        'Thamel',
      ],
    }
  ];
  var _questionIndex = 0;
  int totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
    });
  }

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print("$_questionIndex answer is chosen");
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first App"),
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_resetQuiz),
      ),
    );
  }
}
