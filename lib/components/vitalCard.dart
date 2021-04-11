import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VitalCard extends StatelessWidget {
  final String vital;
  final String image;

  VitalCard({Key key, @required this.vital, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: InkWell(
            onTap: () {
              //pressedVital(context);
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
