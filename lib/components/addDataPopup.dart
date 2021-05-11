import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:dte_epic_interface/user.dart';

class AddDataPopup extends StatelessWidget {
  //final String image;

  AddDataPopup(BuildContext context){
    //needs to be here to work
    pressedVital(context);
  }

  final myController = TextEditingController();

  pressedVital(BuildContext context) {
    // adding a vital

    VoidCallback addVital = () => {
      Navigator.of(context).pop(),
      User.inputData(myController.text),
      myController.clear(),
    };



    // pop up once card is clicked
    //copied from vitalCard file, only lightly edited
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: AlertDialog(
              title: Text('Insert Blood Pressure'),
              // user input area style
              content: TextField(
                controller: myController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink[400]),
                  ),
                  hintText: "Type here",
                  suffixIcon: IconButton(
                    color: Colors.pink[400],
                    onPressed: myController.clear,
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),
              actions: <Widget>[
                // cancel button
                TextButton(
                  child: Text("Cancel", style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    Navigator.of(context).pop();
                    myController.clear();
                  },
                ),
                // add button
                TextButton(
                  child: Text("Add", style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    addVital();
                  },
                ),
              ],
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //necessary to run
    return Center();
  }
}
