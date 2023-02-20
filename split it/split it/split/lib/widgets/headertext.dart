import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).primaryColor,
        child: Column(children: [
          SizedBox(
            height: 30,
            width: double.infinity,
          ),

//this is for split it title

          Stack(
            children: <Widget>[
              // Stroked text as border.
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Split ',
                  style: TextStyle(
                    fontSize: 70,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Colors.blue[700]!,
                  ),
                ),
                Text(
                  'It ',
                  style: TextStyle(
                    fontSize: 70,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Color.fromRGBO(36, 1, 92, 1),
                  ),
                ),
              ]),
              // Solid text as fill.
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Split ',
                  style: TextStyle(
                    fontSize: 70,
                    color: Colors.grey[300],
                  ),
                ),
                Text(
                  'It ',
                  style: TextStyle(
                    fontSize: 70,
                    color: Color.fromRGBO(36, 1, 92, 1),
                  ),
                ),
              ]),
            ],
          )
        ]));
  }
}
