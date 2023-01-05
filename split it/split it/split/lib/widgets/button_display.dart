import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/Data.dart';
import 'dart:math' as math;

class ButtonDisplay extends StatefulWidget {
  const ButtonDisplay({super.key});

  @override
  State<ButtonDisplay> createState() => _ButtonDisplayState();
}

class _ButtonDisplayState extends State<ButtonDisplay> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Data value = Provider.of<Data>(context, listen: true);
    final name1 = value.firstName;
    final name2 = value.secondName;

    void calculateFunction() {
      setState(() {
        value.calculateTotal();
      });
    }

    return Padding(
      padding: EdgeInsets.only(left: 20, top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: size.width * 0.148548512,
            width: size.width * 0.851265597,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(36, 1, 92, 1),
            ),
            child: InkWell(
              child: Center(
                child: Text(
                  value.finalResult == 0 || value.finalResult == null
                      ? 'Final'
                      : value.finalResult! > 0
                          ? '${name1}=+${value.finalResult}'
                          : '${name2}=+${(value.finalResult)!.abs()}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              onTap: calculateFunction,
              onDoubleTap: calculateFunction,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Delete item'),
                    content: Text('Are you sure you want to delete this item?'),
                    actions: [
                      TextButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Delete'),
                        onPressed: () {
                          // delete item here
                          value.clearAll();

                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.clear_all),
            label: Text('Clear All'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(36, 1, 92, 1),
            ),
          )
        ],
      ),
    );
  }
}
