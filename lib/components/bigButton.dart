import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final String buttonText;
  final onClick;
  final accentColor = const Color.fromRGBO(236, 64, 122, 1.0);

  BigButton(
      {this.buttonText, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: accentColor,
        borderRadius: BorderRadius.circular(8.0),
        child: MaterialButton(
          onPressed: onClick,
          minWidth: MediaQuery.of(context).size.width - 20,
          height: 42.0,
          child: Text(
            buttonText, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
