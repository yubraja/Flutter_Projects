import 'package:flutter/material.dart';
import '../widgets/image_input.dart';


class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: _titleController,
                  ),
                  SizedBox(height: 10,),
                  ImageInput(),
                  
                ],
              ),
            )),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            label: Text('Add Place',textAlign: TextAlign.center,style: TextStyle(color: Colors.black),),
            icon: Icon(Icons.add,color: Colors.black,),
            style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.amber) ),
            
          )
        ],
      ),
    );
  }
}