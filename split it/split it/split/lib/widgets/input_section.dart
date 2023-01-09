import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/Data.dart';
import 'package:intl/intl.dart';

class InputSection extends StatelessWidget {
  TextEditingController _itemController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  String typePaid;
  String name;

  void _saveForm(BuildContext context) {
    Provider.of<Data>(context, listen: false).addData(
      item: _itemController.text,
      price: double.parse(_priceController.text),
      date: DateFormat('dd MMM').format(DateTime.now()),
      name: name,
      paymentMethod: typePaid,
    );
  }

  InputSection({required this.name, required this.typePaid});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.099638809,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 3),
                width: size.width * 0.208810797,
                height: size.height * 0.037364553,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 238, 238, 238)),
                  color: Color.fromARGB(255, 211, 210, 210),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: TextField(
                  controller: _itemController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'ITEM',
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 3),
                width: size.width * 0.208810797,
                height: size.height * 0.037364553,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 238, 238, 238)),
                  color: Color.fromARGB(255, 211, 210, 210),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: TextField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'PRICE',
                    
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 1,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(36, 1, 92, 1),
            ),
            onPressed: (() => _saveForm(context)),
            child: Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
