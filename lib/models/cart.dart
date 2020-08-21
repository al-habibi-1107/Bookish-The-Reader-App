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

  Future<void> cartdatabase()async{
    final cartdb= await DBHelper.getCartData('cart');
    _cartItem= cartdb.map((item) {
      return Books().getBookById(item['bookId']);
    }).toList();

   notifyListeners();
  }

  void addBook(int bookId, String user) {
    final Book currentBook =
        bookList.firstWhere((element) => element.bookId == bookId);
    _cartItem.add(currentBook);
    DBHelper.insertCart('cart', {'user': user, 'bookId': bookId});
    notifyListeners();
  }

  void removeBook(int bookId) {
    final Book currentBook =
        bookList.firstWhere((element) => element.bookId == bookId);
        DBHelper.removeCartItem('cart', bookId );
    _cartItem.remove(currentBook);
    notifyListeners();
  }

  double totalPrice() {
    double total = 0;
    _cartItem.forEach((element) {
      total = total + element.price;
    });
    return total;
  }

  void clearCart() {
    _cartItem = [];
  }
}
