import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/books.dart';

class HomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final books = Provider.of<Books>(context).books;
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
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Container(
                      child: Column(
                    children: <Widget>[
                      Image.network(books[index].imageUrl),
                    ],
                  ));
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
