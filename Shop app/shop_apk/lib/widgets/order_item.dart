import 'package:flutter/material.dart';
import '../providers/orders.dart' as ord;
import 'package:intl/intl.dart';
import 'dart:math';

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;
  OrderItem(this.order);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          title: Text("Rs${widget.order.amount}"),
          subtitle: Text(
              DateFormat('dd/MMM/yyyy hh:mm').format(widget.order.dateTime)),
          trailing: IconButton(
            icon: _expanded ? Icon(Icons.expand_less) : Icon(Icons.expand_more),
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
          ),
        ),
        if (_expanded)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 15),
            height: min(widget.order.products.length * 20.0 + 15, 100),
            child: ListView(
                children: widget.order.products
                    .map((prod) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              prod.title,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text('${prod.quantity}x Rs ${prod.price}',
                            style: TextStyle(fontSize: 18,color: Colors.grey),)
                          ],
                        ))
                    .toList()),
          )
      ]),
    );
  }
}
