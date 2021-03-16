import 'package:flutter/material.dart';
import 'dart:io';

import 'package:places_app/widgets/imageInput.dart';
import 'package:provider/provider.dart';
import '../providers/greatPlaces.dart';

class AddPlace extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) return;
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Add a New Place')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextField(
                        controller: _titleController,
                        decoration: InputDecoration(labelText: 'Title'),
                      ),
                      SizedBox(height: 10),
                      ImageInput(_selectImage),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.add, color: Colors.black),
              label: Text('Add Place', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Theme.of(context).accentColor,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: _savePlace,
            )
          ],
        ));
  }
}
