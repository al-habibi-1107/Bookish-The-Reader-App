import 'package:flutter/material.dart';

class Book {
  double bookId;
  String title;
  String author;
  double rating;
  double reviews;
  String imageUrl;

  Book(
      {@required bookId,
      @required title,
      @required author,
      @required rating,
      @required reviews,
      @required imageUrl});
}
