import 'package:flutter/material.dart';
import 'package:dte_epic_interface/screens/graphPage.dart';
import 'package:dte_epic_interface/screens/homePage.dart';
import 'package:dte_epic_interface/screens/profilePage.dart';

class bottomBar extends StatelessWidget {
  final accentColor = const Color.fromRGBO(236, 64, 122, 1.0);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(icon: Icon(Icons.home_outlined), iconSize: 35, onPressed: (){
              // removes slide transition
              Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => HomePage(), transitionDuration: Duration(seconds: 0)));
            }),
            FlatButton(
                onPressed: (){
                  Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => GraphPage(), transitionDuration: Duration(seconds: 0)));
                },
                child: Icon(Icons.add, size: 40, color: Colors.white),
                color: accentColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
            ),
            IconButton(icon: Icon(Icons.person_outline),  iconSize: 35, onPressed: (){
              Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => ProfilePage(), transitionDuration: Duration(seconds: 0)));
            }),
          ],
        ),
      ),
    );
  }
}
