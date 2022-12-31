import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../Providers/Data.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class DisplayValues extends StatelessWidget {
  String typePaid;
  DisplayValues({required this.typePaid});
  String name1 = 'gaurab';

  @override
  Widget build(BuildContext context) {
    final values = Provider.of<Data>(context,listen: true);
    final item = values.data;
    final size = MediaQuery.of(context).size;

    return Container(
      height: typePaid == 'COLLABORATIVE PAYMENTS'
          ? size.height * 0.0996388093
          : size.height * 0.074729107,
      child: item.isEmpty
          ? Center(
              child: Text('Please add some to display!!'),
            )
          : ListView.builder(
              itemBuilder: (context, index) => item[index].name == name1 &&
                      item[index].payementMethod == typePaid
                  ? Container(
                      child: Row(
                        children: [
                          Text('   ${item[index].date}   '),
                          Text(
                            '${item[index].item}-${item[index].price}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  :(item[index].payementMethod==typePaid)? Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('${item[index].date}    '),
                        Text(
                          '${item[index].item}-${item[index].price}   ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ):Container(),
              itemCount: values.data.length,
            ),
    );
  }
}






// ListView.builder(
//               itemBuilder: (context, index) => item[index].name == 'gaurab'
//                   ? Row(
//                       children: [
//                         Text('${item[index].date}      '),
//                         Text(
//                           '${item[index].item}-${item[index].price}',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         )
//                       ],
//                     )
//                   : Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Text('${item[index].date}     '),
//                         Text(
//                           '${item[index].item}-${item[index].price}',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         )
//                       ],
//                     ),
//               itemCount: values.data.length,
//             ),
//           ),
