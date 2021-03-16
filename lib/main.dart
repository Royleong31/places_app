import 'package:flutter/material.dart';
import 'package:places_app/providers/greatPlaces.dart';
import 'package:places_app/screens/addPlace.dart';
import 'package:places_app/screens/placesList.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GreatPlaces>(
      create: (context) => GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesList(),
        routes: {
          PlacesList.routeName: (ctx) => PlacesList(),
          AddPlace.routeName: (ctx) => AddPlace(),
        },
      ),
    );
  }
}
