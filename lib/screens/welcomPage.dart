import 'package:dte_epic_interface/components/bigButton.dart';
import 'package:dte_epic_interface/screens/graphPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//TODO: Decide if using stateless or stateful widget
class WelcomePage extends StatefulWidget {
  static final route = "welcome";
  @override
  _LoginPageState createState() => _LoginPageState();
}

//TODO: Check if the user is already logged in, if so then go directly to the main app (skipping the welcome and login screens)
class _LoginPageState extends State<WelcomePage> {

  String _email;
  String _password;

  Future<void> _createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth
          .instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
      print("User: $userCredential");
    } on FirebaseAuthException catch (e) {
      print("error: $e");
    } catch (e) {
      print("error: $e");
    }
  }

  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth
          .instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      print("User: $userCredential");
      //TODO: Create LoginPage and uncomment / check that this button works
      Navigator.push(context, MaterialPageRoute(builder: (context)=>graphPage()));
    } on FirebaseAuthException catch (e) {
      print("error: $e");
    } catch (e) {
      print("error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
                onSubmitted: (value) {
                  _email = value;
                },
                onChanged: (value) {
                  _email = value;
                },
                decoration: InputDecoration(
                    hintText: "Enter Email"
                )
            ),
            TextField(
                onSubmitted: (value) {
                  _password = value;
                },
                onChanged: (value) {
                  _password = value;
                },
                decoration: InputDecoration(
                    hintText: "Enter Password"
                )
            ),
            Column(
              children: [
                BigButton(
                  buttonText: "Login",
                  onClick: _login,
                ),
                MaterialButton(
                  //TODO: Right now makes new account based on what's in email/pass fields, probably want a createUser page
                  onPressed: _createUser,
                  child: Text("Create New Account"),
                )
              ]
            )
          ],
        ),
      ),
      ),
    );
  }
}
