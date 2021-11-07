import 'package:flutter/material.dart';
import 'package:dte_epic_interface/components/titleBar.dart';
import 'package:dte_epic_interface/components/bottomBar.dart';
import 'package:dte_epic_interface/components/bigButton.dart';
import 'package:dte_epic_interface/components/profilePageButtons.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatelessWidget {
  static final route = "profile";

  final accentColor = const Color.fromRGBO(236, 64, 122, 1.0);
  final myController = TextEditingController();

  onClickLinkAccount(BuildContext context) {
    // TODO: link account
    VoidCallback linkAccount = () => {
      Navigator.of(context).pop(),
      //User.inputData(myController.text),
      myController.clear(),
    };

    // pop up once card is clicked
    showDialog(
      context: context,
      builder: (context) {
        return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: AlertDialog(
              title: Text("Link your account to your hospital:"),
              // user input area style
              content: TextField(
                controller: myController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: accentColor),
                  ),
                  hintText: "Type here",
                  suffixIcon: IconButton(
                    color: accentColor,
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
                  child: Text("Link", style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    linkAccount();
                  },
                ),
              ],
            ));
      },
    );
  }

  onClickNotifications(BuildContext context) {
    //TODO: control notifications here (which vitals get reminders, how often...)
  }

  onClickDeleteAccount(BuildContext context) {
    // TODO: delete account
    // TODO: have them reenter password?
    VoidCallback deleteAccount = () => {
      Navigator.of(context).pop(),
    };

    showDialog(
      context: context,
      builder: (BuildContext context) {
         return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: AlertDialog(
              title: Text("Are you sure you want to delete your account?"),
              actions: <Widget>[
                // cancel button
                TextButton(
                  child: Text("Cancel", style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                // delete account
                TextButton(
                  child: Text("Yes", style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    deleteAccount();
                  },
                ),
              ],
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            children: [
              TitleBar(title: "Profile"),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Name", style: TextStyle(fontSize: 18)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Email", style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ]
                ),
              ),
              ProfilePageButtons(
                text: "Link Account",
                onClick: () {
                  onClickLinkAccount(context);
                },
                bottomBorder: false,
              ),
              ProfilePageButtons(
                text: "Notifications",
                onClick: () {
                  onClickNotifications(context);
                },
                bottomBorder: false,
              ),
              ProfilePageButtons(
                text: "Delete Account",
                onClick: () {
                  onClickDeleteAccount(context);
                },
                bottomBorder: true,
              ),
              BigButton(
                buttonText: "LOG OUT",
                // TODO: logout
                //onClick: _login,
              ),
            ]
        )
      ),
      bottomNavigationBar: bottomBar(),
    );
  }
}