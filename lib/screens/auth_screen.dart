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
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Column(
          children: <Widget>[
            Container(
              child: Image.asset(
                'assets/mountain1_bg.jpg',
                fit: BoxFit.cover,
              ),
              height: _deviceHeight * 0.40,
              //color: Colors.blueAccent.withOpacity(0.7)),
            ),
            Container(
              height: _deviceHeight * 0.60,
              color: Colors.blueGrey.withOpacity(0.3),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[AuthCard()],
        )
      ]),
    );
  }
}
