import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../providers/products.dart';
import '../models/http_exception.dart';
import 'dart:convert';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFavorite = false});

  Future<void> toggleFavoriteStatus(String? token, String? userId) async {
    isFavorite = !isFavorite;
    notifyListeners();

    final url = Uri.parse(
        'https://flutter-update-3a692-default-rtdb.firebaseio.com/userFavorites/$userId/$id.json?auth=$token');
    final response = await http.put(url,
        body: json.encode(
          isFavorite,
        ));
    if (response.statusCode >= 400) {
      isFavorite = !isFavorite;
      notifyListeners();
      throw HttpException("Can't edit favorite of recent item");
    }
  }
}
