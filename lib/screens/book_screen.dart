import 'package:flutter/material.dart';

import '../models/book.dart';

class BookScreen extends StatelessWidget {
  static const routename = '/book-screen';

  @override
  Widget build(BuildContext context) {
    final Book currentBook = ModalRoute.of(context).settings.arguments;
    final device = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.85),
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 40),
                alignment: Alignment.topLeft,
                height: device.height * 0.3,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                height: device.height * 0.7,
                width: device.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                  ),
                  color: Colors.white,
                  elevation: 10,
                  child: Column(),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 110),
            alignment: Alignment.topCenter,
            child: Card(
              color: Colors.transparent,
              elevation: 40,
              child: ClipRRect(
                child: Image.network(
                  currentBook.imageUrl,
                  scale: 0.62,
                ),
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
