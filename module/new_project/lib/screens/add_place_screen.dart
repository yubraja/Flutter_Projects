import 'package:flutter/material.dart';
import '../widgets/image_input.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../Providers/great_places.dart';
import '../widgets/loaction_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }

    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage as File);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add a New Place',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.all(
              10,
            ),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  controller: _titleController,
                ),
                SizedBox(
                  height: 10,
                ),
                ImageInput(_selectImage),
              ],
            ),
          )),

          LocationInput(), 



          ElevatedButton.icon(
            onPressed: _savePlace,
            label: Text(
              'Add Place',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber),
            ),
          ),


          
          
        ],
      ),
    );
  }
}
