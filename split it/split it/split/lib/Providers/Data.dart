import 'package:flutter/material.dart';
import './item_details.dart';
import 'package:intl/intl.dart';
import '../helpers/db_helpers.dart';

class Data with ChangeNotifier {
  late String _name1;
  late String _name2;
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
    String? paymentMethod,
    String? id,
  }) {
    final newItem = ItemDetails(
      item: item!,
      price: price!,
      date: date!,
      name: name!,
      paymentMethod: paymentMethod!,
      id: DateTime.now().toIso8601String(),
    );

    _items.add(newItem);
    notifyListeners();

    DbHelper.insert(
      'SplitIt',
      {
        'item': newItem.item,
        'price': newItem.price,
        'date': newItem.date,
        'name': newItem.name,
        'paymentMethod': newItem.paymentMethod,
        'id': newItem.id as String,
      },
    );
  }

  Future<void> fetchAndSetData() async {
    final dataList = await DbHelper.getData('SplitIt');

    _items = dataList
        .map((item) => ItemDetails(
              item: item['item'],
              price: item['price'],
              date: item['date'],
              name: item['name'],
              paymentMethod: item['paymentMethod'],
              id: item['id'],
            ))
        .toList();

    notifyListeners();
  }

  void calculateTotal() {
    total = 0;
    collaborativeFirst = 0;
    collaborativeSecond = 0;
    individualFirst = 0;
    individualSecond = 0;

//another iterable is created for matching condition

    _firstCollaborative = _items
        .where((element) => (element.name == _name1 &&
            element.paymentMethod == "COLLABORATIVE PAYMENTS"))
        .toList();
//adding value of one person
    for (var element in _firstCollaborative) {
      collaborativeFirst = collaborativeFirst + element.price;
    }

    //same

    _secondCollaborative = _items
        .where((element) => (element.name == _name2 &&
            element.paymentMethod == "COLLABORATIVE PAYMENTS"))
        .toList();
    for (var element in _secondCollaborative) {
      collaborativeSecond = collaborativeSecond + element.price;
    }

    //same

    _firstIndividual = _items
        .where((element) => (element.name == _name1 &&
            element.paymentMethod == "INDIVIDUAL PAYMENTS"))
        .toList();

    for (var element in _firstIndividual) {
      individualFirst = individualFirst + element.price;
    }

//same
    _secondIndividual = _items
        .where((element) => (element.name == _name2 &&
            element.paymentMethod == "INDIVIDUAL PAYMENTS"))
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
    return total.roundToDouble();
  }

  Future<void> clearAll() async {
    _items = [];

    await DbHelper.deleteAll('SplitIt');
    notifyListeners();
  }

  Future<void> clearOne(String id) async {
    _items.removeWhere((element) => element.id == id);

    await DbHelper.deleteOne('SplitIt', id);
    notifyListeners();
  }

  void nameAdder(String fname, String sname) {
    _name1 = fname;
    _name2 = sname;

    print(_name1);
    print(_name2);
  }

  String get firstName {
    return _name1;
  }

  String get secondName {
    return _name2;
  }
}
