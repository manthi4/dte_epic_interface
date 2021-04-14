import 'package:flutter/material.dart';
import 'package:dte_epic_interface/components/bottomBar.dart';
import 'package:dte_epic_interface/components/vitalCard.dart';

class HomePage extends StatefulWidget {
  static final route = "home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Discover"),
        //style: TextStyle(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              VitalCard(vital: "Blood Pressure", image:'lib/images/blood_pressure.png'), // TODO: add units for all vitals
              VitalCard(vital: "Pulse", image:'lib/images/blood_pressure.png'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomBar(),
    );
  }
}
