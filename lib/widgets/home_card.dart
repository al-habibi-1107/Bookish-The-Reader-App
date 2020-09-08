import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../models/books.dart';
import '../screens/book_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // To get access of the List of books in the models/books.dart file
    final books = Provider.of<Books>(context).books;
    // Card with rounded side borders
    return Card(
      shadowColor: dark == 1
          ? Color.fromRGBO(101, 119, 134, 0.5)
          : Color.fromRGBO(163, 217, 239, 0.5),
      color: dark == 1
          ? Color.fromRGBO(101, 119, 134, 1)
          : Color.fromRGBO(163, 217, 239, 1),
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
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 35,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Hunt new books before other bookworms do it..',
              style: GoogleFonts.roboto(
                fontSize: 15,
                color: Colors.white,
              ),
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
                    color: dark == 1
                        ? Color.fromRGBO(101, 119, 134, 1)
                        : Color.fromRGBO(163, 217, 239, 1),
                    margin: EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          BookScreen.routename,
                          arguments: books[index],
                        );
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
                              color:
                                  (dark == 1 ? Colors.white60 : Colors.white),
                            ),
                          ),
                          Text(
                            books[index].title,
                            softWrap: true,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: (dark == 1 ? Colors.white : Colors.white),
                            ),
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
