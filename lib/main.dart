import 'package:flutter/material.dart';
import 'package:flutterblockforms/src/bloc/provider.dart';
import 'package:flutterblockforms/src/pages/home.dart';
import 'package:flutterblockforms/src/pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc, firebase and forms',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        HomePage.routeName: (BuildContext context) => HomePage(),
      },
      theme: ThemeData(primaryColor: Colors.deepPurple),
    ));
  }
}
