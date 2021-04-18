import 'package:flutter/material.dart';
import 'package:dte_epic_interface/screens/graphPage.dart';
import 'package:dte_epic_interface/screens/homePage.dart';

class bottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(icon: Icon(Icons.home_outlined), onPressed: (){
            // removes slide transition
            Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => HomePage(), transitionDuration: Duration(seconds: 0)));
          }),
          FlatButton(
              onPressed: (){
                Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => graphPage(), transitionDuration: Duration(seconds: 0)));
              },
              child: Icon(Icons.add),
              color: Colors.pink[400],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
          ),
          IconButton(icon: Icon(Icons.person_outline), onPressed: (){
            ///TODO: link to profile/settings page
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>*page here*()));
          }),
        ],
      ),
    );
  }
}
