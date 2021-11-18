import 'package:dte_epic_interface/screens/profilePage.dart';
import 'package:flutter/material.dart';
import 'screens/welcomePage.dart';
import 'screens/graphPage.dart';
import 'screens/homePage.dart';
import 'screens/profilePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  //TODO: Setup actual authentication behind the scenes
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final accentColor = const Color.fromRGBO(236, 64, 122, 1.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EPIC App',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: accentColor,
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
        GraphPage.route:(context)=>GraphPage(),
        ProfilePage.route:(context)=>ProfilePage(),
      },
    );
  }
}