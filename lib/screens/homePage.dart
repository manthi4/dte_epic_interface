import 'package:flutter/material.dart';
import 'package:dte_epic_interface/components/bottomBar.dart';
import 'package:dte_epic_interface/components/vitalCard.dart';

class HomePage extends StatelessWidget {
  static final route = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // title bar, TODO: change to be more asthetic
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Discover"),
        // titleTextStyle: TextStyle(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            VitalCard(vital: "Blood Pressure", image:'lib/images/blood_pressure.png'), // TODO: add units for all vitals
            VitalCard(vital: "Pulse", image:'lib/images/blood_pressure.png'),
          ],
        ),
      ),
      bottomNavigationBar: bottomBar(),
    );
  }
}
