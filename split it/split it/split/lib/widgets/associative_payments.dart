import 'package:flutter/material.dart';

class AssociativePayments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 15,
        left: 25,
      ),
      child: SizedBox(
        height: 350,
        width: 350,
        child: Container(
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color.fromARGB(255, 236, 229, 252),
              border: Border.all(
                width: 3,
                color: Theme.of(context).primaryColor,
              )),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                // color: C
                //olor.fromRGBO(36, 1, 92, 1),
                height: 30,
                width: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromRGBO(36, 1, 92, 1),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'COLLABORATIVE PAYMENTS',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Jack'),
                  Text('Jones'),
                ],
              ),
              SizedBox(
                height: 3,
              ),

              Column()
            ],
          ),
        ),
      ),
    );
  }
}
