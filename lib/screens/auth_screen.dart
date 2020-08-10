import 'package:flutter/material.dart';

import '../widgets/auth_card.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // To let the keyboard overlay on screen
      resizeToAvoidBottomInset: false,
      // To stack the Login Card on top of the background
      // for 3D impression, the Widgets will be stacked
      // from bottom to top
      body: Stack(children: [
        // The background (Stack base)
        Column(
          children: <Widget>[
            // A container to hold the background Image - the first half
            // of the background ( 40% of the device size )
            Container(
              child: Image.asset(
                'assets/mountain1_bg.jpg',
                fit: BoxFit.cover,
              ),
              height: _deviceHeight * 0.40,
            ),
            // The second half of the background ( 60% of the device size)
            Container(
              height: _deviceHeight * 0.60,
              color: Colors.blueGrey.withOpacity(0.3),
            )
          ],
        ),
        // Top of the Stack - Layer 2 
        // Contains the Title and the Authentication Card
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 140, left: 20),
              alignment: Alignment.topLeft,
              height: 250,
              child: Row(
                children: <Widget>[
                  Text(
                    'Welcome To ',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 28, color: Colors.greenAccent),
                  ),
                  Text('Bookish ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            // Calling Authentication Card Widget - in widgets folder 
            // Holds The design of the Authentication Card
            AuthCard(),
          ],
        )
      ]),
    );
  }
}
