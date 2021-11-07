import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  final String title;

  TitleBar(
      {this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 50),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(title, style: TextStyle(color: Colors.black, fontSize: 40)),
              ),
            ],
          ),
        )
    );
  }
}