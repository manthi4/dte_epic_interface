import 'package:flutter/material.dart';
import 'screens/welcomPage.dart';
import 'screens/graphPage.dart';
import 'screens/homePage.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  //TODO: Setup actual authentication behind the scenes
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assassin game',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.pink[400],
        primaryTextTheme: TextTheme(
            headline6: TextStyle(
                color: Colors.black
            )
        )
      ),
      initialRoute: WelcomePage.route,
      routes: {
        WelcomePage.route:(context)=>WelcomePage(),
        HomePage.route:(context)=>HomePage(),
        graphPage.route:(context)=>graphPage(),
      },
    );
  }
}