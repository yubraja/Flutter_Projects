// import 'package:flutter/material.dart';
// import '../../widgets/input_section.dart';
// import 'package:provider/provider.dart';

// import '../../widgets/display_values.dart';

// class IndividualPayments extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         top: 15,
//         left: 25,
//       ),
//       child: SizedBox(
//         height: 200,
//         width: 350,
//         child: Container(
//           height: 30,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(40),
//               color: Color.fromARGB(255, 236, 229, 252),
//               border: Border.all(
//                 width: 3,
//                 color: Theme.of(context).primaryColor,
//               )),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 3,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 50),
//                 child: Container(
//                   // color: C
//                   //olor.fromRGBO(36, 1, 92, 1),

//                   height: 30,
//                   width: 220,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: Color.fromRGBO(36, 1, 92, 1),
//                   ),

//                   child: Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: Text(
//                       'INDIVIDUAL PAYMENTS',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(
//                     'JACK',
//                     style: TextStyle(fontWeight: FontWeight.w600),
//                   ),
//                   Text(
//                     'JONES',
//                     style: TextStyle(fontWeight: FontWeight.w600),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 3,
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   InputSection(name: 'gaurab'),
//                   InputSection(name: 'yubraj'),
//                 ],
//               ),
//               DisplayValues(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
