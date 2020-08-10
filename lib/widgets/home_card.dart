import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/books.dart';
import '../screens/book_screen.dart';

class HomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // To get access of the List of books in the models/books.dart file
    final books = Provider.of<Books>(context).books;
    // Card with rounded side borders
    return Card(
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
          // Column with  the Title and the books with image
          // NOTE : all SizedBox are just to give spacing for better look
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Discover New',
              textAlign: TextAlign.left,
              style:
                  TextStyle(fontSize: 28, fontFamily: 'PlayfairDisplay-Italic'),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Hunt new books before other bookworms do it..',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              // A list view for all the info on books with
              // Gesture detector to enable clicking and 
              // navigation to BookScreen
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Container(
                    width: 110,
                    margin: EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(BookScreen.routename,
                            arguments: books[index],);
                       
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Hero(
                                tag: books[index].bookId,
                                child: FadeInImage(
                                  placeholder:
                                      AssetImage('assets/book-placeholder.png'),
                                  image: NetworkImage(
                                    books[index].imageUrl,
                                  ),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Text(
                            books[index].author,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            books[index].title,
                            softWrap: true,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          )
                        ],
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
