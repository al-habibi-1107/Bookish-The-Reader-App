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
                height: device.height * 0.23,
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
                height: device.height * 0.77,
                width: device.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                  ),
                  color: Colors.white,
                  elevation: 10,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 150),
                      Text(
                        currentBook.author,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        currentBook.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 23,
                            fontFamily: 'PlayfairDisplay-Italic'),
                        maxLines: 2,
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Divider(
                        indent: 30,
                        endIndent: 30,
                        thickness: 1.7,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'About Book',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        indent: 150,
                        endIndent: 150,
                        color: Colors.green,
                      ),
                      Container(
                        height: 110,
                        padding: EdgeInsets.all(10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          borderOnForeground: true,
                          elevation: 1,
                          color: Color.fromRGBO(255, 255, 255, 0.85),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Rating',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '${currentBook.rating}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Pages',
                                      style: TextStyle(color: Colors.grey)),
                                  SizedBox(height: 5),
                                  Text(
                                    '${currentBook.pages.round()}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Language',
                                      style: TextStyle(color: Colors.grey)),
                                  SizedBox(height: 5),
                                  Text(
                                    currentBook.language,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 15, left: 20),
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Description',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Text(
                              currentBook.desc,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green),
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            height: 50,
                            width: double.infinity,
                            child: Text(
                              'Add to Cart for 10\$',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50)
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            // height: 300,

            padding: EdgeInsets.only(top: 70),
            alignment: Alignment.topCenter,
            child: Card(
              color: Colors.transparent,
              elevation: 40,
              child: ClipRRect(
                child: Hero(
                  tag: currentBook.bookId,
                  child: Image.network(
                    currentBook.imageUrl,
                    scale: 5,
                  ),
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
