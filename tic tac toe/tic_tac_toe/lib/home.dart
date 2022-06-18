import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //to add icons and icondata
  var cross = Icon(Icons.cancel);
  var circle = Icon(Icons.circle_rounded);
  var edit = Icon(Icons.edit);

  bool isCross = true;
  late String message;
  late List<String> gameState;

  @override
  void initState() {
    super.initState();
    this.message = "";
    gameState = List.filled(9, "empty"); //creating 9 empty boxes
  }

  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
      });
    }
  }

  resetGame() {
    setState(() {
      this.gameState = List.filled(9, "filled");
      this.message = "";
    });
  }

  Icon getImage(String title) {
    switch (title) {
      case ('empty'):
        return edit;
        break;
      case ("cross"):
        return (cross);
        break;
      case ("circle"):
        return (circle);
        break;
    }
    var except = "";
    throw (except);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Tic Tac Toe"),
          ),
          backgroundColor: Colors.deepOrange,
        ),
        body: Column(
          mainAxisAlignment: ManiAxisAlignment.start,
          children: [],
        ));
  }
}
