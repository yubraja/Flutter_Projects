import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (dataSnapshot.error == null) {
            return Consumer<Orders>(builder:((context, orderData, child) => ListView.builder(
              itemCount: orderData.orders.length,
              itemBuilder: ((context, index) =>
                  OrderItem(orderData.orders[index])),
            )));
          } 
          else {
            return Text('An Error Occured');
          }
        },
      ),
      drawer: AppDrawer(),
    );
  }
}
