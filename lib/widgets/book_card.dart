import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../models/cart.dart';


class BookCard extends StatefulWidget {
  // currentBook is passed as parameter so that the card can access
  // the book details of the book selected
  // dialogue is a function that shows the alert box with book
  // description , when clicked on
  final Book currentBook;
  final Function dialogue;
  final String currentUser;
  BookCard(this.currentBook, this.dialogue,this.currentUser);

  @override
  _BookCardState createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  
  bool cart=false;
  var color = Colors.blue;
  void _change(BuildContext ctx) async {
    setState(() {
      color = Colors.green;
      cart=true;
    });
    await new Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // await new Future.delayed(const Duration(seconds: 5));
    //Navigator.of(context).pop();

    // Card with rounded borders with info
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40), topLeft: Radius.circular(40)),
      ),
      color: Colors.white,
      elevation: 10,
      child: Column(
        children: <Widget>[
          SizedBox(height: 145),
          Text(
            widget.currentBook.author,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 3),
          Text(
            widget.currentBook.title,
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
          // Container having the info on Rating ,
          // no of pages and language
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
                        '${widget.currentBook.rating}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Pages', style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 5),
                      Text(
                        '${widget.currentBook.pages.round()}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Language', style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 5),
                      Text(
                        widget.currentBook.language,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          // The Description is a button/ Gesture detector that
          // on a tap fires the Alert Dialog with full description
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
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              widget.dialogue();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.currentBook.desc,
                style: TextStyle(fontSize: 18),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Provider.of<Cart>(context).addBook(widget.currentBook.bookId,widget.currentUser);
              _change(context);
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: color),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 50,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if(!cart)
                  Text(
                    'Add to Cart for  ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                  if(cart)
                  Icon(Icons.card_travel),
                   if(cart)
                  SizedBox(width:10),
                  Text(
                    cart?'Added To Cart'
                    :'\$${widget.currentBook.price}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
