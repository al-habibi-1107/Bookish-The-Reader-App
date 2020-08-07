import 'package:flutter/material.dart';

import './book.dart';

class Books with ChangeNotifier{
  List<Book> _books = [
    Book(
      bookId: 2767052,
      author: 'Suzanne Collins',
      title: 'The Hunger Games',
      rating: 4.34,
      imageUrl: 'https://images.gr-assets.com/books/1447303603m/2767052.jpg',
      reviews: 155254,
    ),
    Book(
      bookId: 3,
      author: 'J.K. Rowling',
      title: 'Harry Potter and the Philosopher\'s Stone',
      rating: 4.44,
      imageUrl: 'https://images.gr-assets.com/books/1474154022m/3.jpg',
      reviews: 75867,
    ),
    Book(
      bookId: 41865,
      author: 'Stephenie Meyer',
      title: 'Twilight',
      rating: 3.57,
      imageUrl: 'https://images.gr-assets.com/books/1361039443m/41865.jpg',
      reviews: 95009,
    )
  ];

  List<Book> get books{
    return _books;
  }
}
