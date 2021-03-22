import 'package:flutter/material.dart';
import 'screens/welcomPage.dart';
import 'screens/graphPage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assassin game',
      theme: ThemeData.light(),
      initialRoute: WelcomePage.route,
      routes: {
        WelcomePage.route:(context)=>WelcomePage(),
        graphPage.route:(context)=>graphPage(),

      },
    );
  }
}