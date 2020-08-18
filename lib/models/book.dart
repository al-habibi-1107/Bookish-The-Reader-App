import 'package:flutter/material.dart';


// The model of a book , parameters a book must contain
class Book {
  final int bookId;
  final String title;
  final String author;
  final double rating;
  final double reviews;
  final String imageUrl;
  final double pages;
  final String language;
  final String desc;
  final double price;

  Book(
      {@required this.bookId,
      @required this.title,
      @required this.author,
      @required this.rating,
      @required this.reviews,
      @required this.imageUrl,
      @required this.language,
      @required this.pages,
      @required this.desc,
      @required this.price});
}
