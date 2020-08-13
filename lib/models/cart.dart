import 'package:flutter/material.dart';

import './book.dart';

class Cart with ChangeNotifier {
  List<Book> _cartItem = [
    Book(
        bookId: 41865,
        author: 'Stephenie Meyer',
        title: 'Twilight',
        rating: 3.57,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/51CeJ+XZOBL.jpg',
        reviews: 95009,
        pages: 690,
        language: 'English-US',
        desc:
            'Bella Swan moves from Phoenix, Arizona to live with her father in Forks, Washington to allow her mother to travel with her new husband, a minor league baseball player. After moving to Forks, Bella finds herself involuntarily drawn to a mysterious, handsome boy, Edward Cullen and eventually learns that he is a member of a vampire family which drinks animal blood rather than human blood',
        price: 9.99),
         Book(
        bookId: 3,
        author: 'J.K. Rowling',
        title: 'Harry Potter and the Philosopher\'s Stone',
        rating: 4.44,
        imageUrl:
            'https://media1.popsugar-assets.com/files/thumbor/-Q9R5WHoEUikdqZWJpl0OL6fo7g/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2013/02/07/3/301/3019466/a7c409363d6d6d9a_harrynew_custom-1fa12c2215710024d4fb570714431f00ca671dc1-s6-c10/i/Harry-Potter-Sorcerer-Stone-USA-15th-Anniversary-Edition.jpg',
        //  'https://i.pinimg.com/originals/8f/8c/68/8f8c6821f2059607e85122c6a38cd11c.jpg',
        reviews: 75867,
        pages: 600,
        language: 'English',
        desc:
            'Harry Potter and the Philosopher\'s Stone is a fantasy novel written by British author J. K. Rowling. The first novel in the Harry Potter series and Rowling\'s debut novel, it follows Harry Potter, a young wizard who discovers his magical heritage on his eleventh birthday, when he receives a letter of acceptance to Hogwarts School of Witchcraft and Wizardry',
        price: 10.12),
  ];

  List<Book> get cartItem {
    return _cartItem;
  }

  void addBook(Book cartBook) {
    _cartItem.add(cartBook);
    notifyListeners();
  }

  void removeBook(Book cartBook) {
    _cartItem.remove(cartBook);
    notifyListeners();
  }

  double totalPrice(){
     double total=0;
    _cartItem.forEach((element) { 
      total=total+element.price;
    });
    return total;
  }
}
