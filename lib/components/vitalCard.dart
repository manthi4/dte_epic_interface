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
    // adding a vital
    VoidCallback addVital = () => {
          Navigator.of(context).pop(),
          User.inputData(myController.text),
          myController.clear(),
        };

    // pop up once card is clicked
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: AlertDialog(
              title: Text(vital),
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
    return Center(
        child: Padding(
        padding: const EdgeInsets.all(15),
        child: InkWell(
          onTap: () {
            pressedVital(context);
          },
          // card style
          child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Stack(children: <Widget>[
                Image(
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                  width: 400.0,
                  height: 350.0,
                ),
                Positioned(
                    bottom: 0,
                    height: 65,
                    width: 400.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[700].withOpacity(0.7),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25))),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(25, 17, 0, 0),
                        child: Text(
                          vital,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                ),
              ])
          ),
        ),
        )
    );
  }
}
