import 'package:flutter/foundation.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [
      ...items
    ]; //three dot means copy of items will be moved instead of direct items
  }
}
