import 'package:flutter/material.dart';

class ProfilePageButtons extends StatelessWidget {
  final String text;
  final onClick;
  final bool bottomBorder;

  final accentColor = const Color.fromRGBO(236, 64, 122, 1.0);

  ProfilePageButtons(
      {this.text, this.onClick, this.bottomBorder});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (this.bottomBorder) ? LastButton() : GeneralButton(),
        MaterialButton(
            onPressed: onClick,
            height: 70.0,
            minWidth: MediaQuery.of(context).size.width,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      text,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    child: Icon(Icons.keyboard_arrow_right, color: Colors.black26, size: 35),
                  ),
                ]
            )
          ),
      ]
    );
  }
}

class GeneralButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          )
      ),
    );
  }
}

class LastButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
          ),
      ),
    );
  }
}