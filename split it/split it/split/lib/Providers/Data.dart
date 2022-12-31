import 'package:flutter/material.dart';
import './item_details.dart';
import 'package:intl/intl.dart';

class Data with ChangeNotifier {
  String name1 = 'gaurab';
  String name2 = 'yubraj';

  List<ItemDetails> _items = [];

  List<ItemDetails> get data {
    return [..._items];
  }

  List<ItemDetails> _firstCollaborative = [];
  double collaborativeFirst = 0;
  List<ItemDetails> _secondCollaborative = [];
  double collaborativeSecond = 0;

  List<ItemDetails> _firstIndividual = [];
  double individualFirst = 0;

  List<ItemDetails> _secondIndividual = [];
  double individualSecond = 0;

  double total = 0;

  void addData({
    String? item,
    double? price,
    String? date,
    String? name,
    String? payementMethod,
  }) {
    final newItem = ItemDetails(
      item: item!,
      price: price!,
      date: date!,
      name: name!,
      payementMethod: payementMethod!,
    );

    _items.add(newItem);
    notifyListeners();
  }


  void clearAll()
  {


  }

  void calculateTotal() {
    total = 0;
    collaborativeFirst = 0;
    collaborativeSecond = 0;
    individualFirst = 0;
    individualSecond = 0;

//another iterable is created for matching condition

    _firstCollaborative = _items
        .where((element) => (element.name == name1 &&
            element.payementMethod == "COLLABORATIVE PAYMENTS"))
        .toList();
//adding value of one person
    for (var element in _firstCollaborative) {
      collaborativeFirst = collaborativeFirst + element.price;
    }

    //same

    _secondCollaborative = _items
        .where((element) => (element.name == name2 &&
            element.payementMethod == "COLLABORATIVE PAYMENTS"))
        .toList();
    for (var element in _secondCollaborative) {
      collaborativeSecond = collaborativeSecond + element.price;
    }

    //same

    _firstIndividual = _items
        .where((element) => (element.name == name1 &&
            element.payementMethod == "INDIVIDUAL PAYMENTS"))
        .toList();

    for (var element in _firstIndividual) {
      individualFirst = individualFirst + element.price;
    }

//same
    _secondIndividual = _items
        .where((element) => (element.name == name2 &&
            element.payementMethod == "INDIVIDUAL PAYMENTS"))
        .toList();

    for (var element in _secondIndividual) {
      individualSecond = individualSecond + element.price;
    }

    total = (collaborativeFirst - collaborativeSecond) / 2 +
        individualFirst -
        individualSecond;
    
//calc
  }

  double? get finalResult {
    print(total);
    return total;
  }
}
