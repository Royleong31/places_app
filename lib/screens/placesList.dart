import 'package:flutter/material.dart';
import 'package:places_app/providers/greatPlaces.dart';
import 'package:places_app/screens/addPlace.dart';
import 'package:provider/provider.dart';

class PlacesList extends StatelessWidget {
  static const routeName = '/places-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Places'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlace.routeName);
              },
            ),
          ],
        ),
        body: Center(
            child: Consumer<GreatPlaces>(
          child: const Text('Got no places yet! Got to start building some!'),
          builder: (ctx, greatPlaces, ch) {
            if (greatPlaces.items.length <= 0) return ch;
            return ListView.builder(
              itemCount: greatPlaces.items.length,
              itemBuilder: (ctx, i) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(
                    greatPlaces.items[i].image,
                  ),
                ),
                title: Text(greatPlaces.items[i].title),
                onTap: () {},
              ),
            );
          },
        )));
  }
}
