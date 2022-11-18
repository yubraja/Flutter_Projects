import 'package:flutter/material.dart';
import 'package:shop_apk/screens/cart_screen.dart';
import '../widgets/product_grid.dart';
import 'package:provider/provider.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import '../widgets/app_drawer.dart';

import '../providers/products.dart';

enum FilterOptions {
  // ignore: constant_identifier_names
  Favorites,
  // ignore: constant_identifier_names
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavoritesOnly = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // Future.delayed(Duration(seconds: 0)).then((value) {
    //   Provider.of<Products>(context).fetchAndSetProducts();

    // });

    //this can directly work if you add llisten =false or can be using didChangeDependecnies
    // Provider.of<Products>(context, listen: false).fetchAndSetProducts();

    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    //init and didchange fxns shouldn't have async and await
    if (_isInit) {
      setState(() {
        _isLoading = true;
    
      });
      
      Provider.of<Products>(context, listen: false)
          .fetchAndSetProducts()
          .then((value) {
            setState(() {
              _isLoading = false;

            });
        });
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          Consumer<Cart>(
            builder: ((context, value, ch) =>
                Badge(value: value.itemCount.toString(), child: ch as Widget)),
            child: IconButton(
                icon: const Icon(Icons
                    .shopping_cart), //if we pass like this then it won't reuilt every time since it is not in builder function
                onPressed: (() {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                })),
          ),
          PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    // productsContainer.showFavoritesOnly();
                    _showFavoritesOnly = true;
                  } else {
                    // productsContainer.showAll();
                    _showFavoritesOnly = false;
                  }
                });
              },
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: FilterOptions.Favorites,
                      child: Text("Only Favorites"),
                    ),
                    const PopupMenuItem(
                      value: FilterOptions.All,
                      child: Text('Show All'),
                    )
                  ]),
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading?Center(child: CircularProgressIndicator(),):ProductGrid(_showFavoritesOnly),
    );
  }
}
