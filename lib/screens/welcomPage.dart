import 'package:dte_epic_interface/components/bigButton.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  static final route = "welcome";
  ///TODO: Implement FireBase Auth here
  ///TODO: Check if the user is already logged in, if so then go directly to the main app (skipping the welcome and login screens)

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
            BigButton(
              buttonText: "Login",
              onClick: (){
                ///TODO: Create LoginPage and uncomment / check that this button works
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen(loggingIn: true,)));
              },
            )
          ],
        ),
    ),
      ),
    );
  }
}
