import 'package:flutter/material.dart';
import 'package:flutterblockforms/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Inicio')),
      body: Center(
        child: Text('usuario: ${bloc.email}'),
      ),
      
    );
  }
}