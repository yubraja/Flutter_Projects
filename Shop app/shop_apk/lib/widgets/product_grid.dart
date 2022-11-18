import "package:flutter/material.dart";
import '../providers/products.dart';
import './product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  bool showFavs;
  ProductGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =showFavs==false? productsData
        .items:productsData.favoritesItems; //this is not private variable of products but getter named itmesI
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: ((context, index) => ChangeNotifierProvider.value(
            //you can use without value and use below commented (vlaue rebuilt all but next can use older widget if contains so sometime it can create some error for list or grid types values)
            value:  products[
                index], //if child changes then it passs the value by using function
            // value: Products(),
            child: ProductItem(//child contains element which can be changed
                // id: products[index].id,
                // title: products[index].title,
                // imageUrl: products[index].imageUrl),
                ))));
  }
}
