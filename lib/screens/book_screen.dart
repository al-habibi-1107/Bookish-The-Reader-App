import 'package:flutter/material.dart';

import '../models/book.dart';
import '../widgets/book_card.dart';

class BookScreen extends StatelessWidget {
  static const routename = '/book-screen';

  @override
  Widget build(BuildContext context) {
    // Getting the book as an argument which is clicked on from the previous
    // screen and storing it in a variable to access its properties
    final Book currentBook = ModalRoute.of(context).settings.arguments;
    final device = MediaQuery.of(context).size;

    void dialogue() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(currentBook.title),
          content: Text(currentBook.desc),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.85),
      // For Stacking up the card and the book image
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Making the back button functional
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
                // BookCard - widget for displaying the card with title
                //and other info of the selected book
                //code in /widgets/book_card
                child: BookCard(currentBook, dialogue),
              )
            ],
          ),
          // Container having the image of the book,
          // stacked up on the background card
          Container(
            padding: EdgeInsets.only(top: 75),
            alignment: Alignment.topCenter,
            child: Card(
              color: Colors.transparent,
              elevation: 40,
              child: ClipRRect(
                child: Hero(
                  tag: currentBook.bookId,
                  child: Image.network(
                    currentBook.imageUrl,
                    scale: 5.2,
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
