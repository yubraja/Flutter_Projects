import 'package:flutter/widgets.dart';

class ItemDetails {
  String item;
  double price;
  String date;
  String name;
  String paymentMethod;
  String? id;

  ItemDetails({
    required this.item,
    required this.price,
    required this.date,
    required this.name,
    required this.paymentMethod,
     this.id
  });
}
