import 'package:flutter/material.dart';
import '../models/place.dart';
import '../helpers/db_helpers.dart';
import 'dart:io';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];

    //three dot means copy of items will be moved instead of direct items
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        image: pickedImage,
        title: pickedTitle,
        location: null);

    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');

    _items=dataList
        .map((item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: null))
        .toList();

    notifyListeners();
  }
}
