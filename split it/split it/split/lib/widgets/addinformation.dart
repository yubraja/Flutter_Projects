import 'package:flutter/material.dart';
import '../Providers/Data.dart';
import 'package:provider/provider.dart';

//baki kaam continue chapda arko ma jane rw saveform chaiyo
class AddInformation extends StatelessWidget {
  TextEditingController _name1Controller = TextEditingController();
  TextEditingController _name2Controller = TextEditingController();

  final focusNode1=FocusNode();
  final focusNode2=FocusNode();



  @override
  Widget build(BuildContext context) {
    void _saveForm() {
      Provider.of<Data>(context,listen: false)
          .nameAdder(_name1Controller.text, _name2Controller.text);
    }

    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 0.018682277 * size.height),
      padding: EdgeInsets.only(left: 0.045836516 * size.width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Person1',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 0.026155187 * size.height),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.018682277 * size.height),
            height: size.height * 0.039364553,
            width: size.width * 0.73364553,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 238, 238, 238)),
              color: Color.fromARGB(255, 211, 210, 210),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: TextField(
              controller: _name1Controller,
              focusNode: focusNode1,
              
              decoration: InputDecoration(
                hintText: '          Enter your name',
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.043591979,
          ),
          Text(
            'Person2',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.018682277 * size.height),
            height: size.height * 0.039364553,
            width: size.width * 0.73364553,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 238, 238, 238)),
              color: Color.fromARGB(255, 211, 210, 210),
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
            child: TextField(
              controller: _name2Controller,
              focusNode: focusNode2,
              decoration:
                  InputDecoration(hintText: '          Enter your name'),
            ),
          ),
          SizedBox(
            height: size.height * 0.099638809,
          ),
          Container(
            height: size.height * 0.062274256,
            width: size.width * 0.38197097,
            margin: EdgeInsets.only(left: size.width * 0.226636109),
            child: ElevatedButton(
              onPressed: () {
                _saveForm();
              },
              clipBehavior: Clip.antiAlias,
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 22),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 59, 2, 151),
              ),
            ),
          )
        ],
      ),
    );
  }
}
