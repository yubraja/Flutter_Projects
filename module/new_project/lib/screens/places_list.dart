import 'package:flutter/material.dart';
import '../screens/add_place_screen.dart';
import 'package:provider/provider.dart';
import '../Providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    child: Center(
                      child: Text('Got no places yet, start adding some!!'),
                    ),
                    builder: (ct, greatplaces, ch) => greatplaces.items.isEmpty
                        ? ch!
                        : ListView.builder(
                            itemCount: greatplaces.items.length,
                            itemBuilder: (ctx, i) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage: FileImage(
                                  greatplaces.items[i].image,
                                ),
                              ),
                              title: Text(
                                greatplaces.items[i].title,
                              ),
                              onTap: () {
                                //go to detail page....
                              },
                            ),
                          )),
      ),
    );
  }
}
