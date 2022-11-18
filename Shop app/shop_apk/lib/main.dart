import 'package:flutter/material.dart';
import 'package:shop_apk/screens/product_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import 'package:provider/provider.dart';
import './providers/cart.dart';
import './screens/cart_screen.dart';
import './providers/orders.dart';
import './screens/order_screen.dart';
import './screens/user_product_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/auth-screen.dart';
import './providers/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => Auth())),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (context) => Products('', []),
          update: ((context, auth, previousProducts) => Products(auth.token,
              previousProducts == null ? [] : previousProducts.items)),
        ), //here value provides auth object since it is just above this widget
        ChangeNotifierProvider(create: ((context) => Cart())),
        ChangeNotifierProxyProvider<Auth,Orders>(create: (context) => Orders('',[]),
        update: (context, auth, previousOrders) => Orders(auth.token, previousOrders==null?[]:previousOrders.orders),),
      ],
      child: Consumer<Auth>(
          builder: ((ctx, auth, _) => MaterialApp(
                title: 'My Shop',
                theme: ThemeData(
                  primarySwatch: Colors.purple,
                  accentColor: Colors.deepOrange,
                  fontFamily: 'Lato',
                ),
                home:
                 auth.isAuth
                    ? const ProductOverviewScreen()
                    : const AuthScreen(),
                debugShowCheckedModeBanner: false,
                routes: {
                  ProductDetailScreen.routeName: (context) =>
                      ProductDetailScreen(),
                  CartScreen.routeName: (context) => CartScreen(),
                  OrderScreen.routeName: (context) => OrderScreen(),
                  UserProductScreen.routeName: ((context) =>
                      UserProductScreen()),
                  EditProductScreen.routeName: ((context) =>
                      EditProductScreen()),
                  AuthScreen.routeName: ((context) => AuthScreen()),
                },
              ))),
    );
  }
}
