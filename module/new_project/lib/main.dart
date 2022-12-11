import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Providers/great_places.dart';
import './screens/places_list.dart';
import './screens/add_place_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
         
          primarySwatch: Colors.indigo,
          secondaryHeaderColor:  Colors.amber,
          buttonColor: Colors.amber
        ),
        home:PlacesListScreen(), 
        routes:{
          AddPlaceScreen.routeName:(ctx)=>AddPlaceScreen(),
        } ,
      ),
    );
  }
}