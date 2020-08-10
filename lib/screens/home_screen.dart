import 'package:flutter/material.dart';


import '../widgets/home_card.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size.height;
    return Scaffold(
      // Stack - To stack the List of cards on
      // the background 
      body: Stack(
        children: <Widget>[
          //35% of device Size to fill with image 
          Container(
            height: deviceSize * 0.35,
            child: Image.asset(
              'assets/book.jpg',
              fit: BoxFit.contain,
            ),
          ),
          // Stack Level 2
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 400,
                width: double.infinity,
                // The Home Card Widget, Code in widgets/home_card.dart
                child: HomeCard(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
