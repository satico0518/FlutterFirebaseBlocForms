import 'package:flutter/material.dart';
import 'package:flutterblockforms/src/bloc/provider.dart';
import 'package:flutterblockforms/src/pages/home.dart';
import 'package:flutterblockforms/src/pages/login.dart';
import 'package:flutterblockforms/src/pages/pet.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FanPet',
      initialRoute: HomePage.routeName,
      routes: {
        LoginPage.routeName: (BuildContext context) => LoginPage(),
        HomePage.routeName: (BuildContext context) => HomePage(),
        PetPage.routeName: (BuildContext context) => PetPage()
      },
      theme: ThemeData(primaryColor: Colors.deepPurple),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'EN'),
        const Locale('es', 'ES')
      ]
    ));
  }
}
