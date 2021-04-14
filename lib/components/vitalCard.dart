import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:dte_epic_interface/user.dart';


class VitalCard extends StatelessWidget {
  final String vital;
  final String image;

  VitalCard({Key key, @required this.vital, @required this.image}) : super(key: key);

  final myController = TextEditingController();

  pressedVital(BuildContext context) {
    VoidCallback addVital = () => {
      Navigator.of(context).pop(),
      User.inputData(myController.text),
      myController.clear(),
    };
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child:  AlertDialog(
              title: new Text(vital),
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
                new TextButton(
                  child: new Text("Cancel", style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    Navigator.of(context).pop();
                    myController.clear();
                  },
                ),
                new TextButton(
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
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: InkWell(
            onTap: () {
              pressedVital(context);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Stack(
                children: <Widget>[
                  Image(
                    fit: BoxFit.cover,
                    image: AssetImage(image),
                    width: 400.0,
                    height: 350.0,
                  ),
                  Positioned(
                    bottom: 12,
                    left: 17,
                    child: Text(
                      vital, style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  )
                ]
              )
            ),
          ),
        )
    );
  }
}
