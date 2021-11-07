import 'package:dte_epic_interface/components/titleBar.dart';
import 'package:flutter/material.dart';
import 'package:dte_epic_interface/components/bottomBar.dart';
import 'package:dte_epic_interface/components/vitalCard.dart';

class HomePage extends StatelessWidget {
  static final route = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            TitleBar(title: "Discover"),
            Expanded(
              child: ListView(
                  children: <Widget>[
                    VitalCard(vital: "Blood Pressure", image:'lib/images/blood_pressure.png'), // TODO: add units for all vitals
                    VitalCard(vital: "Pulse", image:'lib/images/blood_pressure.png'),
                  ],
              )
            ),
          ],
        ),
        bottomNavigationBar: bottomBar(),
    );
  }
}