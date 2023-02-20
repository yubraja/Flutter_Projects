import 'package:flutter/material.dart';
import './input_section.dart';

import '../widgets/display_values.dart';
import '../Providers/Data.dart';
import 'package:provider/provider.dart';

class AssociativePayments extends StatelessWidget {
  String typePaid;
  AssociativePayments({required this.typePaid});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final value = Provider.of<Data>(context,listen: false);
    final name1 = value.firstName;
    final name2 = value.secondName;
    return Padding(
      padding: EdgeInsets.only(
        top: typePaid == 'COLLABORATIVE PAYMENTS'
            ? size.height * 0.01868227
            : size.height * 0.01868227,
        left: size.width * 0.063661828,
      ),
      child: Container(
        height: typePaid == 'COLLABORATIVE PAYMENTS'
            ? size.height * 0.311371279
            : size.height * 0.286461577,
        width: size.width * 0.891265597,
        child: Container(
          height: size.height * 0.037364553,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Color.fromARGB(255, 236, 229, 252),
            border: Border.all(
              color: Color.fromRGBO(36, 1, 92, 1),
              width: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.006227426,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Container(
                  // color: C
                  //olor.fromRGBO(36, 1, 92, 1),

                  height: size.height * 0.037364553,
                  width: size.width * 0.56022409,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromRGBO(36, 1, 92, 1),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      typePaid,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.014945821,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    name1,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    name2,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.012454851,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputSection(name: name1, typePaid: typePaid),
                  InputSection(name: name2, typePaid: typePaid),
                ],
              ),
              DisplayValues(typePaid: typePaid),
            ],
          ),
        ),
      ),
    );
  }
}
