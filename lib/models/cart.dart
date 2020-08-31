import 'package:bookish/helpers/db_helper.dart';
import 'package:flutter/material.dart';

import './book.dart';
import '../models/books.dart'; 

class Cart with ChangeNotifier {
  List<Book> _cartItem = [];

  List<Book> get cartItem {
    return _cartItem;
  }

  List<Book> bookList = Books().books;



  // Get the data of the cart by the user from the database
  Future<void> cartdatabase(String user)async{
    final cartdb= await DBHelper.getCartData('cart',user);
    _cartItem= cartdb.map((item) {
      return Books().getBookById(item['bookId']);
    }).toList();

   notifyListeners();
  }

  // Add the book passed into the user database

  void addBook(int bookId, String user) {

    final Book currentBook =
        bookList.firstWhere((element) => element.bookId == bookId);
    _cartItem.add(currentBook);
    DBHelper.insertCart('cart', {'user': user, 'bookId': bookId});
    notifyListeners();
  }

  // Function ot remove a book from the cart
  // Remove also from the database
  void removeBook(int bookId) {
    final Book currentBook =
        bookList.firstWhere((element) => element.bookId == bookId);
        DBHelper.removeCartItem('cart', bookId );
    _cartItem.remove(currentBook);
    notifyListeners();
  }

  // Calculate the total price 
  // calculated the total price for elements in the cart
  double totalPrice() {
    double total = 0;
    _cartItem.forEach((element) {
      total = total + element.price;
    });
    return total;
  }

  // clear cart elements
  void clearCart() {
    _cartItem = [];
  }
}
