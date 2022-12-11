import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/user_product_item.dart';
import '../widgets/app_drawer.dart';
import '../screens/edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user-products';

  const UserProductScreen({super.key});

  Future<void> _refreshProduct(BuildContext context) async {
    await Provider.of<Products>(context,listen: false).fetchAndSetProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    // final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Products"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: _refreshProduct(context),

        builder: (context, snapshot) =>snapshot.connectionState==ConnectionState.waiting?Center(child: CircularProgressIndicator(),): RefreshIndicator(
          onRefresh: () =>
            _refreshProduct(context)
          ,
          child: Consumer<Products>(
            builder: (context, productsData, child) => Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                itemBuilder: ((context, index) => Column(
                      children: [
                        UserProductItem(
                            id: productsData.items[index].id,
                            title: productsData.items[index].title,
                            imageUrl: productsData.items[index].imageUrl),
                        Divider()
                      ],
                    )),
                itemCount: productsData.items.length,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
