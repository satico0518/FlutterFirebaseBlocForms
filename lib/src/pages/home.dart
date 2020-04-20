import 'package:flutter/material.dart';
import 'package:flutterblockforms/src/bloc/provider.dart';
import 'package:flutterblockforms/src/pages/pet.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Inicio')),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.pets),
        onPressed: () => Navigator.pushNamed(context, PetPage.routeName)
      ),
      
    );
  }
}