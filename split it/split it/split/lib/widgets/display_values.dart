import 'package:flutter/material.dart';
import '../Providers/Data.dart';
import 'package:provider/provider.dart';

class DisplayValues extends StatelessWidget {
  String typePaid;
  DisplayValues({required this.typePaid});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String name1 = Provider.of<Data>(context,listen:false).firstName;


    return FutureBuilder(
      future: Provider.of<Data>(context, listen: false).fetchAndSetData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );

//               );

        } else if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        } else {
          return Container(
              height: typePaid == 'COLLABORATIVE PAYMENTS'
                  ? size.height * 0.0996388093
                  : size.height * 0.074729107,
              child: Consumer<Data>(
                child: Center(
                  child: Text('Please add some to display!!'),
                ),
                builder: (context, data, ch) => data.data.length <= 0
                    ? ch as Widget
                    : ListView.builder(
                        itemBuilder: (context, index) => data
                                        .data[index].name ==
                                    name1 &&
                                data.data[index].paymentMethod == typePaid
                            ? GestureDetector(
                                  onLongPress: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Delete item'),
                                          content: Text(
                                              'Are you sure you want to delete this item?'),
                                          actions: [
                                            TextButton(
                                              child: Text('Cancel'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              child: Text('Delete'),
                                              onPressed: () {
                                                // delete item here

                                                data.clearOne(
                                                    data.data[index].id! );

                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                child: Container(
                                  child: Row(
                                    children: [
                                      Text('   ${data.data[index].date}   '),
                                      Text(
                                        '${data.data[index].item}-${data.data[index].price}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : (data.data[index].paymentMethod == typePaid)
                                ? GestureDetector(
                                  onLongPress: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Delete item'),
                                            content: Text(
                                                'Are you sure you want to delete this item?'),
                                            actions: [
                                              TextButton(
                                                child: Text('Cancel'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                child: Text('Delete'),
                                                onPressed: () {
                                                  // delete item here

                                                  data.clearOne(
                                                      data.data[index].id!);

                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  child: Container(
                                    child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text('${data.data[index].date}    '),
                                          Text(
                                            '${data.data[index].item}-${data.data[index].price}   ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                  ),
                                )
                                : Container(),
                        itemCount: data.data.length,
                      ),
              ));
        }
      },
    );
  }
}
