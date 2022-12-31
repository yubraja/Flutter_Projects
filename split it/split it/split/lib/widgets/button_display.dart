import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/Data.dart';

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

    void calculateFunction() {

      setState(() {
      value.calculateTotal();

      });
      
    }

    return Padding(
      padding: EdgeInsets.only(left: 20, top: 40),
      child: Container(
        height: size.width * 0.148548512,
        width: size.width * 0.851265597,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(36, 1, 92, 1),
        ),
        child: InkWell(
          child: Center(
            child: Text(
              value.finalResult == null
                  ? 'FINAL'
                  : value.finalResult.toString(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          onTap: calculateFunction,
          onDoubleTap: calculateFunction,
        ),
      ),
    );
  }
}
