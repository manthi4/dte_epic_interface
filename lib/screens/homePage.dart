import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:dte_epic_interface/components/bottomBar.dart';
import 'package:dte_epic_interface/components/vitalCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discover"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              VitalCard(vital: "Blood Pressure", image:'lib/images/blood_pressure.png'),
              VitalCard(vital: "Pulse", image:'lib/images/blood_pressure.png'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomBar(),
    );
  }
}
