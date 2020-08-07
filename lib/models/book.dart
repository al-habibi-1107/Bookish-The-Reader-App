import 'package:flutter/material.dart';

class Book {
  final double bookId;
  final String title;
  final String author;
  final double rating;
  final double reviews;
  final String imageUrl;

  Book(
      {@required this.bookId,
      @required this.title,
      @required this.author,
      @required this.rating,
      @required this.reviews,
      @required this.imageUrl});
}
