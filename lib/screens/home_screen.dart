import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: deviceSize * 0.3,
            child: Image.asset(
              'assets/book.jpg',
              fit: BoxFit.contain,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 350,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  elevation: 10,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 30,
                      left: 30,
                      bottom: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Discover New',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 28),
                        ),
                        SizedBox(height: 5,),
                        Text('Hunt new books before other bookworms do it..',style: TextStyle(fontSize:12,color: Colors.grey),)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
