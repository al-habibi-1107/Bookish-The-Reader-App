import 'package:flutter/material.dart';

import './book.dart';

class Books with ChangeNotifier {
  List<Book> _books = [
    Book(
        bookId: 2767052,
        author: 'Suzanne Collins',
        title: 'The Hunger Games',
        rating: 4.34,
        imageUrl: 'https://images.gr-assets.com/books/1447303603m/2767052.jpg',
        reviews: 155254,
        pages: 365,
        language: 'English',
        desc:
            'The Hunger Games universe is a dystopia set in Panem, a North American country consisting of the wealthy Capitol and 13 districts in varying states of poverty. Every year, children from the first 12 districts are selected via lottery to participate in a compulsory televised battle royale death match called The Hunger Games.'),
    Book(
      bookId: 3,
      author: 'J.K. Rowling',
      title: 'Harry Potter and the Philosopher\'s Stone',
      rating: 4.44,
      imageUrl: 'https://images.gr-assets.com/books/1474154022m/3.jpg',
      reviews: 75867,
      pages: 600,
      language: 'English',
      desc:
          'Harry Potter and the Philosopher\'s Stone is a fantasy novel written by British author J. K. Rowling. The first novel in the Harry Potter series and Rowling\'s debut novel, it follows Harry Potter, a young wizard who discovers his magical heritage on his eleventh birthday, when he receives a letter of acceptance to Hogwarts School of Witchcraft and Wizardry',
    ),
    Book(
      bookId: 41865,
      author: 'Stephenie Meyer',
      title: 'Twilight',
      rating: 3.57,
      imageUrl: 'https://images.gr-assets.com/books/1361039443m/41865.jpg',
      reviews: 95009,
      pages: 690,
      language: 'English-US',
      desc:
          'Bella Swan moves from Phoenix, Arizona to live with her father in Forks, Washington to allow her mother to travel with her new husband, a minor league baseball player. After moving to Forks, Bella finds herself involuntarily drawn to a mysterious, handsome boy, Edward Cullen and eventually learns that he is a member of a vampire family which drinks animal blood rather than human blood',
    )
  ];

  List<Book> get books {
    return _books;
  }
}
